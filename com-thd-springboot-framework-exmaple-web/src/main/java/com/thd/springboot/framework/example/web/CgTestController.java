package com.thd.springboot.framework.example.web;
import com.thd.springboot.framework.example.service.CgTestService;
import com.thd.springboot.framework.example.entity.CgTestEntity;
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
 * controller.CgTestController
 **/
@RestController
@RequestMapping("/cgTest")
public class  CgTestController extends BasicController{

	@Autowired
	private  CgTestService  cgTestService;

	/**
	 * 添加数据
	 */
	@PostMapping(value = "/insertCgTest")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/cgTest/insertCgTest
	public Message insertCgTest(@RequestBody CgTestEntity  cgTest) {
		// 生成主键
		if(StringUtils.isEmpty(cgTest.getUserId())){
			cgTest.setUserId(UUID.randomUUID().toString().replace("-",""));
		}
		cgTestService.insert(cgTest);
		return success(cgTest);
	}

	/**
	 * 修改数据
	 *
	 * @param  cgTest
	 * @return
	 */
	@PutMapping(value = "/updateCgTest")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/cgTest/updateCgTest
	public Message updateCgTest(@RequestBody CgTestEntity  cgTest) {
		 cgTestService.update(cgTest);
		return success(cgTest);
	}

	/**
	 * 获取数据
	 *
	 * @param userId
	 * @return
	 */
	@GetMapping("/queryCgTestById/{userId}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/cgTest/queryCgTestById
	public Message queryCgTestById(@PathVariable String userId) {
		 CgTestEntity  cgTest  =  cgTestService.queryById(userId);
		if( cgTest == null){
			return error("No qualifying record!");
		}
		return success(cgTest);
	}

	/**
	 * 列表数据
	 *
	 * @param  condition
	 * @return
	 */
	 // url : http://127.0.0.1:8899/thd/cgTest/findCgTestPage
	@GetMapping("/findCgTestPage")
	@ResponseBody
	public Message findCgTestPage(CgTestEntity condition) {
		PageInfo<CgTestEntity> pager = cgTestService.queryListLikeByPage(condition);
		return success(pager);
	}

	/**
	 * 删除数据
	 *
	 * @param userId
	 * @return
	 */
	@DeleteMapping("/deleteCgTest/{userId}")
	@ResponseBody
	// url : http://127.0.0.1:8899/thd/cgTest/deleteCgTest
	public Message deleteCgTest(@PathVariable String userId) {
		cgTestService.deleteLogicById(userId);
		return success();
	}

    /**
     * 批量新增
     * @param list
     * @return
     */
    @PostMapping("/insertCgTestBatch")
    @ResponseBody
    public Message insertCgTestBatch(@RequestBody List<CgTestEntity> list) {
        cgTestService.insertBatch(list);
        return success();
    }

    /**
     * 根据条件查询
     * @param condition
     * @return
     */
    @GetMapping("/queryCgTestByCondition")
    @ResponseBody
    public Message queryCgTestByCondition(CgTestEntity condition) {
        CgTestEntity entity = cgTestService.queryByCondition(condition);
        return success(entity);
    }

}

