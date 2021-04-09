package ${coding.basicPackageName}.${coding.controllerPackageName};
import ${coding.basicPackageName}.${coding.servicePackageName}.${table.nameBigCamel}Service;
import ${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.thd.springboot.framework.web.BasicController;
import com.thd.springboot.framework.model.Message;
import org.apache.commons.lang3.StringUtils;
import java.util.*;


/**
 * ${coding.controllerPackageName}.${table.nameBigCamel}Controller
 **/
@RestController
@RequestMapping("/${table.nameCamel}")
public class  ${table.nameBigCamel}Controller extends BasicController{

	@Autowired
	private  ${table.nameBigCamel}Service  ${table.nameCamel}Service;

	@ResponseBody
    @PostMapping("/add${table.nameBigCamel}")
    // url : http://127.0.0.1:8899/thd/cg/add${table.nameBigCamel}
    public Message add${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity entity){
        entity.setId(UUID.randomUUID().toString());
        this.${table.nameCamel}Service.insert(entity);
        return Message.success("SUCCESS");
    }

    @ResponseBody
    @PostMapping("/update${table.nameBigCamel}")
    // url : http://127.0.0.1:8899/thd/cg/update${table.nameBigCamel}
    public Message update${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity entity){
        int updateCount = this.${table.nameCamel}Service.update(entity);
        if(updateCount!=1){
            throw new RuntimeException(" Update Failed !");
        }
        return Message.success("SUCCESS");
    }

    @ResponseBody
    @DeleteMapping("/physicsDelete${table.nameBigCamel}/{id}")
    // url : http://127.0.0.1:8899/thd/cg/physicsDelete${table.nameBigCamel}/15
    public Message physicsDelete${table.nameBigCamel}(@PathVariable String id){
        this.${table.nameCamel}Service.deletePhysicsById(id);
        return Message.success("SUCCESS");
    }

    @ResponseBody
    @DeleteMapping("/logicDelete${table.nameBigCamel}/{id}")
    // url : http://127.0.0.1:8899/thd/cg/logicDelete${table.nameBigCamel}/15
    public Message logicDelete${table.nameBigCamel}(@PathVariable String id){
        this.${table.nameCamel}Service.deleteLogicById(id);
        return Message.success("SUCCESS");
    }


    @ResponseBody
    @DeleteMapping("/deleteLogicBy${table.nameBigCamel}Ids")
    // url : http://127.0.0.1:8899/thd/cg/deleteLogicBy${table.nameBigCamel}Ids
    public Message deleteLogicBy${table.nameBigCamel}Ids(@RequestBody List<String> ids){
        List<Object> idObjList = new ArrayList<Object>();
        ids.forEach(id -> idObjList.add(id));
        this.${table.nameCamel}Service.deleteLogicByIds(idObjList);
        return Message.success("SUCCESS");
    }

    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}ById/{id}")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}ById/2
    public Message query${table.nameBigCamel}(@PathVariable String id){
        ${table.nameBigCamel}Entity entity = this.${table.nameCamel}Service.queryById(id);
        return Message.success(entity);
    }

    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}EqByPage")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}EqByPage
    public Message query${table.nameBigCamel}EqByPage(${table.nameBigCamel}Entity entity){
        PageInfo pi = this.${table.nameCamel}Service.queryListEqByPage(entity);
        return Message.success(pi);
    }

    @ResponseBody
    @RequestMapping("/query${table.nameBigCamel}LikeByPage")
    // url : http://127.0.0.1:8899/thd/cg/query${table.nameBigCamel}LikeByPage
    public Message query${table.nameBigCamel}LikeByPage(${table.nameBigCamel}Entity entity){
        PageInfo pi = this.${table.nameCamel}Service.queryListLikeByPage(entity);
        return Message.success(pi);
    }

    @ResponseBody
    @RequestMapping("/insert${table.nameBigCamel}Batch")
    // url : http://127.0.0.1:8899/thd/cg/insert${table.nameBigCamel}Batch
    public Message insert${table.nameBigCamel}Batch(){

        List<${table.nameBigCamel}Entity> l = new ArrayList<${table.nameBigCamel}Entity>();
        for(int i = 0 , j = 10 ; i < j ; i++){
            ${table.nameBigCamel}Entity entity = new ${table.nameBigCamel}Entity();
            entity.setId("id_" + i );
            entity.setUserAge(i);
            entity.setUserBirthday(new Date());
            entity.setUserName("devil13th_" + i);
            l.add(entity);

        }
        this.${table.nameCamel}Service.insertBatch(l);
        return Message.success("Success");
    }

}

