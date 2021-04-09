<#assign get="${" />
import React from "react";
import PropTypes from "prop-types";
import ${table.nameBigCamel}Api from "@/api/${table.nameBigCamel}Api";
import { Row, Col } from "antd";
import DateUtils from '@/tools/DateUtils'

class ${table.nameBigCamel}View extends React.Component {
  state = {
    data: {},

    colSpan:{
        xs:24,
        sm:12,
        md:8,
        lg:6,
        xl:4,
        xxl:3
    }

  };

  static propTypes = {
    cgExampleId: PropTypes.string,
    canEdit: PropTypes.bool

  };

  //指定默认标签属性值
  static defaultProps = {
    ${table.nameCamel}Id: ""//sex默认值为男
  };
  componentDidMount() {
    if (this.props.${table.nameCamel}Id) {

      ${table.nameBigCamel}Api.query${table.nameBigCamel}ById(this.props.${table.nameCamel}Id).then((r) => {
        const rst = r.result;
        if(rst.userBirthday){
            rst.userBirthday = DateUtils.formatToDate(rst.userBirthday)
        }
        this.setState({
          data: r.result,
        });
      });
    }
  }


  render() {
    return (
      <div>

        <Row gutter={24}>



            <Col {...this.state.colSpan}>
                <dl className="form_col">
                    <dt>PK</dt>
                    <dd>
                    {this.state.data.${table.pkColumn.nameCamel}}
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
                                      {DateUtils.formatToDate(this.state.data.${col.nameCamel})}
                                    </dd>
                                </dl>
                              </Col>
                        <#else>
                            <Col {...this.state.colSpan}>
                              <dl className="form_col">
                                    <dt>${col.nameCamel}</dt>
                                    <dd>
                                      {this.state.data.${col.nameCamel}}
                                    </dd>
                                </dl>
                              </Col>
                        </#if>
                        </#if>
                    </#list>

        </Row>

      </div>
    );
  }
}

export default ${table.nameBigCamel}View;
