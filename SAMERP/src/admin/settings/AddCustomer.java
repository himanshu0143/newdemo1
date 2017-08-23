package admin.settings;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.General.GenericDAO;

/**
 * Servlet implementation class AddCustomer
 */
@WebServlet("/AddCustomer")
public class AddCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Add Customer
		PrintWriter out = response.getWriter();
		GenericDAO dao = new GenericDAO();

		String custid = request.getParameter("custid");
		String deleteid=request.getParameter("deleteid");
		String upadateselect=request.getParameter("q");
		
		
		String custName = request.getParameter("custname");
		String address = request.getParameter("address");
		String contactno = request.getParameter("contactno");
		String rate = request.getParameter("rate");
		
		
		String Customer_query="";
		int Customer_result=0;

		if (custid==null && deleteid==null && upadateselect==null) {
			
			Customer_query = "INSERT INTO `customer_master`(`intcustid`, `custname`, `address`, `contactno`, `rate`) VALUES (DEFAULT,'"
					+ custName + "','" + address + "','" + contactno + "','" + rate + "')";

			Customer_result = dao.executeCommand(Customer_query);

			if (Customer_result == 1) {
				response.sendRedirect("jsp/admin/settings/addCustomer.jsp");
			} else {
				out.print("something wrong");
			}
		} else if (deleteid==null && upadateselect==null) {

			Customer_query = "UPDATE `customer_master` SET `custname`='"+custName+"',`address`='"+address+"',`contactno`='"+contactno+"',`rate`='"+rate+"' WHERE `intcustid`="+custid;

			Customer_result = dao.executeCommand(Customer_query);

			if (Customer_result == 1) {
				response.sendRedirect("jsp/admin/settings/addCustomer.jsp");
			} else {
				out.print("something wrong");
			}
		}else if (upadateselect==null) {
			Customer_query="DELETE FROM `customer_master` WHERE `intcustid`="+deleteid;
			Customer_result = dao.executeCommand(Customer_query);

			if (Customer_result == 1) {
				response.sendRedirect("jsp/admin/settings/addCustomer.jsp");
				
			} else {
				out.print("something wrong");

			}
		}else {
			Customer_query="SELECT * FROM `customer_master` where `intcustid`="+upadateselect;
			List CustomerList=dao.getData(Customer_query);
			
			Iterator itr = CustomerList.iterator();
			while (itr.hasNext()) {
				out.print(itr.next() + "~");

			}
		}
	}

}
