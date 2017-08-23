package admin.JcbPocWork;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.General.GenericDAO;

/**
 * Servlet implementation class JcbPocDetails
 */
@WebServlet("/JcbPocDetails")
public class JcbPocDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JcbPocDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		GenericDAO dao = new GenericDAO();
		
		String CustomerSearch = request.getParameter("q");
		String CustomerPrint = request.getParameter("CustomerPrint");
		String updateselect = request.getParameter("updateselect");
		String update = request.getParameter("update");
		String jcbpocid = request.getParameter("jcbpocid");
		String deleteid =request.getParameter("deleteid");
		
		String custid=request.getParameter("custid");
		
		String vehicleid=request.getParameter("vehicle");
		String chalanno=request.getParameter("chalanno");
		String chalandate=request.getParameter("chalandate");
		String workhrs=request.getParameter("workhrs");
		String vehiclerate=request.getParameter("vehiclerate");

		String query = "";
		int result=0;

		List details = null;
		if (custid != null) {
			String[] arrayOfString = chalandate.split("-");
		
			query = "INSERT INTO `jcbpoc_master`(`intjcbpocid`, `intcustid`, `intvehicleid`, `chalanno`, `data`, `workhr`, `rate`) VALUES (DEFAULT,'"+custid+"','"+vehicleid+"','"+chalanno+"','"+arrayOfString[2]+"-"+arrayOfString[1]+"-"+arrayOfString[0]+"','"+workhrs+"','"+vehiclerate+"')";

			result = dao.executeCommand(query);

			if (result == 1) {
				response.sendRedirect("jsp/admin/jcb-poc work/jcb-pocDetails.jsp");
			} else {
				out.print("something wrong");
			}
		}
		if (update !=null && jcbpocid != null) {
			String[] arrayOfString = chalandate.split("-");
			query = "UPDATE `jcbpoc_master` SET `intvehicleid`='"+vehicleid+"',`chalanno`='"+chalanno+"',`data`='"+arrayOfString[2]+"-"+arrayOfString[1]+"-"+arrayOfString[0]+"',`workhr`='"+workhrs+"',`rate`='"+vehiclerate+"' WHERE `intjcbpocid`="+jcbpocid;

			result = dao.executeCommand(query);

			if (result == 1) {
				response.sendRedirect("jsp/admin/jcb-poc work/jcb-pocDetails.jsp");
			} else {
				out.print("something wrong");
			}
		}
		if (deleteid !=null) {
			query = "DELETE FROM `jcbpoc_master` WHERE `intjcbpocid`="+deleteid;

			result = dao.executeCommand(query);

			if (result == 1) {
				response.sendRedirect("jsp/admin/jcb-poc work/jcb-pocDetails.jsp");
			} else {
				out.print("something wrong");
			}
		}
		if (updateselect != null) {
			query="SELECT customer_master.`custname`,customer_master.address,customer_master.contactno,customer_master.rate,jcbpoc_master.`chalanno`,vehicle_details.vehicle_aliasname,jcbpoc_master.`data`,jcbpoc_master.`workhr`,jcbpoc_master.intjcbpocid FROM `jcbpoc_master`,customer_master,vehicle_details WHERE jcbpoc_master.intcustid=customer_master.intcustid AND jcbpoc_master.intvehicleid=vehicle_details.vehicle_id AND jcbpoc_master.intjcbpocid="+updateselect;
			details=dao.getData(query);
			
			Iterator itr = details.iterator();
			while (itr.hasNext()) {
				out.print(itr.next() + "~");

			}
		}
		if (CustomerPrint != null) {
			query="SELECT * FROM `customer_master` where `intcustid`="+CustomerPrint;
			details=dao.getData(query);
			
			Iterator itr = details.iterator();
			while (itr.hasNext()) {
				out.print(itr.next() + "~");

			}
		}
		if (CustomerSearch != null){
			query="SELECT `intcustid`,`custname` FROM `customer_master` WHERE `custname` LIKE '"+CustomerSearch+"%' UNION SELECT `intcustid`,`contactno` FROM customer_master WHERE `contactno` LIKE '"+CustomerSearch+"%'";
			System.out.println("query 1====" + query);
			details = dao.getData(query);
			System.out.println("Query===" + details);

			Iterator itr = details.iterator();
			while (itr.hasNext()) {
				out.print(itr.next() + ",");

			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
