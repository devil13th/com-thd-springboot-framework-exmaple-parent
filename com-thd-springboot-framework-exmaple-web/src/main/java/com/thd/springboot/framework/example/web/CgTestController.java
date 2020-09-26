package com.thd.springboot.framework.example.web;
import com.github.pagehelper.PageInfo;
import com.thd.springboot.framework.example.entity.CgTestEntity;
import com.thd.springboot.framework.example.service.CgTestService;
import com.thd.springboot.framework.model.Message;
import com.thd.springboot.framework.web.BasicController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * cgtest.controller.CgTestController
 **/
@RestController
@RequestMapping("/cgTest")
public class  CgTestController extends BasicController {

	@Autowired
	private CgTestService cgTestService;

	/**
	 * 添加数据
	 */
	@PostMapping(value = "/insertCgTest")
	@ResponseBody
	public Message insertCgTest(@RequestBody CgTestEntity cgTest) {
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
	 * @param  cgTest
	 * @return
	 */
	@GetMapping("/findCgTestPage")
	@ResponseBody
	public Message findCgTestPage(CgTestEntity cgTest) {
		PageInfo<CgTestEntity> pager = cgTestService.queryListLikeByPage(cgTest);
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
	public Message deleteCgTest(@PathVariable String userId) {
		cgTestService.deleteLogic(userId);
		return success();
	}



}

