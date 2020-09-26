package ${coding.basicPackageName}.${coding.controllerPackageName};
import com.lenovo.gsc.tech.framework.model.Message;
import com.lenovo.gsc.tech.framework.model.Pager;
import com.lenovo.gsc.tech.framework.base.controller.BasicController;
import ${coding.basicPackageName}.${coding.servicePackageName}.${table.nameBigCamel}Service;
import ${coding.basicPackageName}.${coding.entityPackageName}.${table.nameBigCamel}Entity;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
	 * @param  ${table.nameCamel}
	 * @return
	 */
	@GetMapping("/find${table.nameBigCamel}Page")
	@ResponseBody
	public Message find${table.nameBigCamel}Page(${table.nameBigCamel}Entity ${table.nameCamel}) {
		PageInfo<${table.nameBigCamel}Entity> pager = ${table.nameCamel}Service.queryListLikeByPage(${table.nameCamel});
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
	public Message delete${table.nameBigCamel}(@PathVariable ${table.pkColumn.dataType} ${table.pkColumn.nameCamel}) {
		${table.nameCamel}Service.deleteLogic(${table.pkColumn.nameCamel});
		return success();
	}



}

