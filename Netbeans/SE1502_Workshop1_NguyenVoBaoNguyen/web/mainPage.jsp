<%@page import="UserManagement.User"%>
<%@page import="BookManagement.Books"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of books</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
        <style>
            .form-control-borderless {
                border: none;
            }

            .form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
                border: none;
                outline: none;
                box-shadow: none;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Books> ldt = new ArrayList<Books>();//Khời tạo
            String n = (String) request.getAttribute("names");
            ldt = (ArrayList<Books>) request.getAttribute("data");%>
<!--        <div class="container">
              <script>
            $(function () {
                $('#myModal').modal('show');
            });
        </script>
             The Modal 
            <div class="modal fade" id="myModal">
                <div class="modal-dialog">
                    <div class="modal-content">

                         Modal Header 
                        <div class="modal-header">
                            <h3 class="modal-title">Login Successful</h3>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                         Modal body 
                        <div class="modal-body">
                            <h5 style="font-weight: bold">Welcome user <%=n%></h5>
                        </div>

                         Modal footer 
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

        </div>    -->
        <h1 style="text-align: center; font-size: 550%; color: rosybrown">Welcome to <%=n%>'s Book Management page</h1>
        <div class="container" >
            <br/>
            <div class="row justify-content-center">
                <div class="col-12 col-md-10 col-lg-8">
                    <form class="card card-sm" action="BookandUserManagementServlet?action=search" method="POST" name="s">
                        <div class="card-body row no-gutters align-items-center">
                            <div class="col-auto">
                                <i class="fas fa-search h4 text-body"></i>
                            </div>
                            <!--end of col-->
                            <div class="col">
                                <input class="form-control form-control-lg form-control-borderless" type="number" placeholder="Find a book using Book ID" name="bid">
                            </div>
                            <!--end of col-->
                            <div class="col-auto">
                                <button class="btn btn-lg btn-success" type="submit">Search</button>
                            </div>
                            <!--end of col-->
                        </div>
                    </form>
                </div>
                <!--end of col-->
            </div>
        </div>
        <table width="900px"  class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Category Name</th> <th>Book ID </th> <th>Name </th> <th>Author</th> <th>Publish Year</th> <th>Short Description</th> <th>Status</th> 
                    <th> </th> <th> </th>
                </tr>
            </thead>
            <%for (Books dt : ldt) {%>
            <tr>
                <td><%=dt.getCateID()%></td>
                <td><%=dt.getBookID()%></td>
                <td><%=dt.getBookName()%></td>
                <td><%=dt.getAuthor()%></td>
                <td><%=dt.getPublishYear()%></td>
                <td><%=dt.getShortDescription()%></td>
                <td><%=dt.getStatus()%></td>


                <td><a href="BookandUserManagementServlet?action=updateform&pid=<%=dt.getBookID()%>" class="btn btn-primary">Edit</a></td>
                <td><a  onclick="return confirmation()" href="BookandUserManagementServlet?action=delete&pid=<%=dt.getBookID()%>" class="btn btn-primary">Delete</a></td>

            </tr>
            

            <%}%> 
        </table>
        
        <div class="btn-group-vertical">
            <a href="BookandUserManagementServlet?action=addform" class="btn btn-primary""> Add new book </a> <br>
            <a href="BookandUserManagementServlet?action=addCate" class="btn btn-primary"> Add new Category </a> <br> <br>
                        <a href="BookandUserManagementServlet?action=viewCate" class="btn btn-primary"> View new Category </a> <br> <br>

            <!--<a href="BookandUserManagementServlet?action=find" class="btn btn-info"> Find a book by ID </a>--> 

        </div>

        <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
