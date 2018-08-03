package com.example.project.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.junit.runner.Request;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dao.ReplyDAO;
import com.example.project.model.dto.BoardVO;
import com.example.project.model.dto.ReplyVO;
import com.example.project.service.ReplyService;
@RestController
@RequestMapping("/reply/*")
public class ReplyController {
  
  @Inject
  ReplyService replyService;
  
  // 1_1. ��� �Է�(@Controller������� ��� �Է�)
  @RequestMapping("insert.do")
  public void insert(@ModelAttribute ReplyVO vo, HttpSession session){
     
      String userId = (String) session.getAttribute("userId");
      vo.setReplyer(userId);
     
      replyService.create(vo);
  }
  
  // 2_1. ��� ���(@Controller��� : veiw(ȭ��)�� ����)
  @RequestMapping("list.do")
  public ModelAndView list(@RequestParam int bno,   ModelAndView mav){
      
      List<ReplyVO> list = replyService.list(bno);
      mav.setViewName("board/replyList");
      mav.addObject("list", list);
   
      return mav;
  }
  
  
  // 2_2. ��� ���(@RestController��� : Json���� �����͸� ����)
  /*
  @RequestMapping("listJson.do")
  @ResponseBody // ���ϵ����͸� json���� ��ȯ(RestController���� @ResponseBody��������)
  public List<ReplyVO> listJson(@RequestParam int bno){
      // ����¡ ó��
     
      List<ReplyVO> list = replyService.list(bno);
      // list�� ����
      return list;
  }
  */
  
  // ** Controller �߰� ���� - Rest������� ��� ���, ����, ���� ó��
  
  // 2_3. ��� ���
  /*
  @RequestMapping(value="/list/{bno}/", method=RequestMethod.GET)
  public ModelAndView replyList(@PathVariable("bno") int bno, ModelAndView mav){
         
      List<ReplyVO> list = replyService.list(bno);
      mav.setViewName("board/replyList");
      mav.addObject("list", list);
      return mav;
  }
 */
  
  // 3. ��� �� ����
 
  @RequestMapping(value="/detail/{rno}", 
		  method=RequestMethod.GET)
  public ModelAndView replyDetail(@PathVariable("rno") int rno,
		                          ModelAndView mav){
  
	  ReplyVO vo = replyService.detail(rno);
      mav.setViewName("board/replyDetail");
      mav.addObject("vo", vo);
 
      return mav;
  }

  
  
  
  
  // 4. ��� ���� ó�� 
  @RequestMapping(value="/update/{rno}", method={RequestMethod.PUT,
		                                  RequestMethod.PATCH})
   
  public ResponseEntity<String> replyUpdate
       (@PathVariable("rno") int rno, @RequestBody ReplyVO vo)
  {
      ResponseEntity<String> entity = null;
      try {
          vo.setRno(rno);
          replyService.update(vo);
         
          entity = new ResponseEntity<String>("success", 
        		  HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
         
          entity = new ResponseEntity<String>(e.getMessage(),
        		  HttpStatus.BAD_REQUEST);
      }
       return entity;
  }
  
  // 5. ��� ����ó��
  @RequestMapping(value="/delete/{rno}")
  public ResponseEntity<String> replyDelete(@PathVariable("rno") Integer rno){
      ResponseEntity<String> entity = null;
      try {
          replyService.delete(rno);
          // ��� ������ �����ϸ� ���� ���¸޽��� ����
          entity = new ResponseEntity<String>("success", HttpStatus.OK);
      } catch (Exception e) {
          e.printStackTrace();
          // ��� ������ �����ϸ� ���� ���¸޽��� ����
          entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      // ���� ó�� HTTP ���� �޽��� ����
      return entity;
  }
}
    


