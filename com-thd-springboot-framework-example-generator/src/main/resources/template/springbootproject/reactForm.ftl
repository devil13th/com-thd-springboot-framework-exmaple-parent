<#assign get="${" />
import React from "react";
import PropTypes from "prop-types";
import ${table.nameBigCamel}Api from "@/api/${table.nameBigCamel}Api";
import {
  message,
  Input,
  Row,
  Col,
  DatePicker,
  Space,
  Button,
  Divider,
} from "antd";
import { SaveOutlined, RollbackOutlined } from "@ant-design/icons";
import DateUtils from "@/tools/DateUtils";
import moment from "moment";
class ${table.nameBigCamel}Form extends React.Component {
  state = {
    formData: {},
    inputSize:'normal',
    formStatus: "CREATE",
    // colSpan: {
    //   xs: 24,
    //   sm: 12,
    //   md: 8,
    //   lg: 6,
    //   xl: 4,
    //   xxl: 3,
    // },
    colSpan:{
      xs:24,
      sm:24,
      md:24,
      lg:24,
      xl:24,
      xxl:24
    }
  };

  static propTypes = {
    ${table.nameCamel}Id: PropTypes.string,
    canEdit: PropTypes.bool,
    closeFn: PropTypes.func,
    cb: PropTypes.func,
  };

  //指定默认标签属性值
  static defaultProps = {
    ${table.nameCamel}Id: "", //sex默认值为男
    canEdit: true, //age默认值为18
    closeFn: () => {},
  };
  componentDidMount() {
    if (this.props.${table.nameCamel}Id) {
      this.setState({
        formStatus: "EDIT",
      });

      ${table.nameBigCamel}Api.query${table.nameBigCamel}ById(this.props.${table.nameCamel}Id).then((r) => {
        const rst = r.result;
        if (rst.userBirthday) {
          rst.userBirthday = DateUtils.formatToDate(rst.userBirthday);
        }
        this.setState({
          formData: r.result,
        });
      });
    }
  }

  createInputMode = (e, propName) => {
    this.setState({
      formData: {
        ...this.state.formData,
        [propName]: e.target.value,
      },
    });
  };

  createDateMode = (v, propName) => {
    this.setState({
      formData: {
        ...this.state.formData,
        [propName]: v,
      },
    });
  };

  createInput = (propName) => {
    return (
      <Input
        size={this.state.inputSize}
        value={this.state.formData[propName]}
        onChange={(e) => {
          this.createInputMode(e, propName);
        }}
      />
    );
  };

  save${table.nameBigCamel} = () => {
    if (this.state.formStatus === "CREATE") {
      ${table.nameBigCamel}Api.add${table.nameBigCamel}(this.state.formData)
        .then((r) => {
          // console.log(r);
          this.props.closeFn();
          if (this.props.cb) {
            this.props.cb();
          }
          message.info("SUCCESS");
        })
        .catch((r) => {});
    } else {
      ${table.nameBigCamel}Api.update${table.nameBigCamel}(this.state.formData)
        .then((r) => {
          // console.log(r);
          this.props.closeFn();
          if (this.props.cb) {
            this.props.cb();
          }
          message.info("SUCCESS");
        })
        .catch((r) => {});
    }
  };
  render() {
    return (
      <div>
        {JSON.stringify(this.state.formData)}

        <Row gutter={24}>
          <Col {...this.state.colSpan}>
            <dl className="form_col">
              <dt>PK</dt>
              <dd>
                <Input
                  size={this.state.inputSize}
                  value={this.state.formData.${table.pkColumn.nameCamel}}
                  onChange={(e) => {
                    this.createInputMode(e, "${table.pkColumn.nameCamel}");
                  }}
                />
              </dd>
            </dl>
          </Col>



          <#list table.normalColumns as col>
            <#if  col.name!="is_deleted" &&
                col.name!="create_by" &&
                col.name!="modify_by" &&
                col.name!="create_time" &&
                col.name!="modify_time"
            >

            <#if col.dataType=="Date" >
                <Col {...this.state.colSpan}>
                    <dl className="form_col">
                      <dt>${col.nameCamel}</dt>
                      <dd>
                        <DatePicker
                          size={this.state.inputSize}
                          onChange={(moment, dataStr) => {
                            this.createDateMode(dataStr, "${col.nameCamel}");
                          }}
                          value={
                            this.state.formData.${col.nameCamel}
                              ? moment(
                                  this.state.formData.${col.nameCamel},
                                  "YYYY-MM-DD"
                                )
                              : null
                          }
                        />
                      </dd>
                    </dl>
                  </Col>
            <#elseif col.dataType=="String" >
                 <Col {...this.state.colSpan}>
                  <dl className="form_col">
                    <dt>${col.nameCamel}</dt>
                    <dd>
                      <Input
                        size={this.state.inputSize}
                        value={this.state.formData.${col.nameCamel}}
                        onChange={(e) => {
                          this.createInputMode(e, "${col.nameCamel}");
                        }}
                      />
                    </dd>
                  </dl>
                </Col>
            <#elseif col.dataType=="Integer" || col.dataType=="Float" || col.dataType=="Double" >
                <Col {...this.state.colSpan}>
                    <dl className="form_col">
                      <dt>${col.nameCamel}</dt>
                      <dd>
                        <Input
                          size={this.state.inputSize}
                          value={this.state.formData.${col.nameCamel}}
                          onChange={(e) => {
                            this.createInputMode(e, "${col.nameCamel}");
                          }}
                        />
                      </dd>
                    </dl>
                  </Col>
            <#else>
                <Col {...this.state.colSpan}>
                    <dl className="form_col">
                      <dt>${col.nameCamel}</dt>
                      <dd>
                        <Input
                          size={this.state.inputSize}
                          value={this.state.formData.${col.nameCamel}}
                          onChange={(e) => {
                            this.createInputMode(e, "${col.nameCamel}");
                          }}
                        />
                      </dd>
                    </dl>
                  </Col>
            </#if>

            </#if>
        </#list>

        </Row>
        <Divider></Divider>
        <div style={{ textAlign: "right" }}>
          <Space>
            <Button
              type="primary"
              icon={<SaveOutlined />}
              onClick={this.save${table.nameBigCamel}}
            >
              Save
            </Button>

            <Button icon={<RollbackOutlined />} onClick={this.props.closeFn}>
              Cancel
            </Button>
          </Space>
        </div>
      </div>
    );
  }
}

export default ${table.nameBigCamel}Form;
