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

	/**
	 * 添加数据
	 */
	@PostMapping(value = "/insert${table.nameBigCamel}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/${table.nameCamel}/insert${table.nameBigCamel}
	public Message insert${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity  ${table.nameCamel}) {
		// 生成主键
		if(StringUtils.isEmpty(${table.nameCamel}.get${table.pkColumn.nameBigCamel}())){
			${table.nameCamel}.set${table.pkColumn.nameBigCamel}(UUID.randomUUID().toString().replace("-",""));
		}
		${table.nameCamel}Service.insert(${table.nameCamel});
		return success(${table.nameCamel});
	}

	/**
	 * 修改数据
	 *
	 * @param  ${table.nameCamel}
	 * @return
	 */
	@PutMapping(value = "/update${table.nameBigCamel}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/${table.nameCamel}/update${table.nameBigCamel}
	public Message update${table.nameBigCamel}(@RequestBody ${table.nameBigCamel}Entity  ${table.nameCamel}) {
		 ${table.nameCamel}Service.update(${table.nameCamel});
		return success(${table.nameCamel});
	}

	/**
	 * 获取数据
	 *
	 * @param ${table.pkColumn.nameCamel}
	 * @return
	 */
	@GetMapping("/query${table.nameBigCamel}ById/{${table.pkColumn.nameCamel}}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/${table.nameCamel}/query${table.nameBigCamel}ById
	public Message query${table.nameBigCamel}ById(@PathVariable ${table.pkColumn.dataType} ${table.pkColumn.nameCamel}) {
		 ${table.nameBigCamel}Entity  ${table.nameCamel}  =  ${table.nameCamel}Service.queryById(${table.pkColumn.nameCamel});
		if( ${table.nameCamel} == null){
			return error("No qualifying record!");
		}
		return success(${table.nameCamel});
	}

	/**
	 * 列表数据
	 *
	 * @param  condition
	 * @return
	 */
	 // url : http://127.0.0.1:8899/thd/${table.nameCamel}/find${table.nameBigCamel}Page
	@GetMapping("/find${table.nameBigCamel}Page")
	@ResponseBody
	public Message find${table.nameBigCamel}Page(${table.nameBigCamel}Entity condition) {
		PageInfo<${table.nameBigCamel}Entity> pager = ${table.nameCamel}Service.queryListLikeByPage(condition);
		return success(pager);
	}

	/**
	 * 删除数据
	 *
	 * @param ${table.pkColumn.nameCamel}
	 * @return
	 */
	@DeleteMapping("/delete${table.nameBigCamel}/{${table.pkColumn.nameCamel}}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/${table.nameCamel}/delete${table.nameBigCamel}
	public Message delete${table.nameBigCamel}(@PathVariable ${table.pkColumn.dataType} ${table.pkColumn.nameCamel}) {
		${table.nameCamel}Service.deleteLogicById(${table.pkColumn.nameCamel});
		return success();
	}

    /**
     * 批量新增
     * @param list
     * @return
     */
    @PostMapping("/insert${table.nameBigCamel}Batch")
    @ResponseBody
    public Message insert${table.nameBigCamel}Batch(@RequestBody List<${table.nameBigCamel}Entity> list) {
        ${table.nameCamel}Service.insertBatch(list);
        return success();
    }

    /**
     * 根据条件查询
     * @param condition
     * @return
     */
    @GetMapping("/query${table.nameBigCamel}ByCondition")
    @ResponseBody
    public Message query${table.nameBigCamel}ByCondition(${table.nameBigCamel}Entity condition) {
        ${table.nameBigCamel}Entity entity = ${table.nameCamel}Service.queryByCondition(condition);
        return success(entity);
    }

}

