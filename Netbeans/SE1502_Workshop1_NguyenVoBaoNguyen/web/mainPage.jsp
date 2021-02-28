<%@page import="BookManagement.Categories"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV="Pragma" CONTENT="no-cache">
        <META HTTP-EQUIV="Expires" CONTENT="-1">
        <title>List of Categories</title>
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
        <script language=" JavaScript" >

            function LoadOnce()
            {
                window.location.reload();
            }

        </script>
    </head>
    <body onLoad="LoadOnce()" >
        <%
            ArrayList<Categories> c = new ArrayList<>();//Khời tạo
            c = (ArrayList<Categories>) request.getAttribute("data2");
        %>
        <h1 style="text-align: center; font-size: 350%; color: rosybrown">Welcome to Book Management page</h1>
        <a href="BookandUserManagementServlet?action=logout" class="btn btn-primary" style="float: right; display: inline-block"> Logout </a> <br>

        <!--        <div class="container" >
                    <br/>
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-10 col-lg-8">
                            <form class="card card-sm" action="BookandUserManagementServlet?action=search" method="POST" name="s">
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    end of col
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="number" placeholder="Find a book using Book ID" name="bid">
                                    </div>
                                    end of col
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-success" type="submit">Search</button>
                                    </div>
                                    end of col
                                </div>
                            </form>
                        </div>
                        end of col
                    </div>
                </div>
        -->
        <% if (c != null) {%>
        <div class="table-responsive">
            <table width="900px" class="table table-striped table-bordered table-hover" >
                <thread class="thead-dark">
                    <tr style="text-align: center">
                        <th>Category ID</th> <th>Category Name </th>
                    </tr>
                </thread>
                <%for (Categories dt : c) {%>
                <tr>
                    <td><%=dt.getCateID()%></td>
                    <td>
                        <a class="btn btn-outline-success" href="BookandUserManagementServlet?action=search&cid=<%=dt.getCateID()%>&cname=<%=dt.getCateName()%>"><%=dt.getCateName()%></a> <br>  <br>
                    </td>

                </tr>

                <%}
                } else {%>
                <section>
                    <h3><strong>No Categories to print out</strong></h3>
                </section> <%}%>
                </tr>
            </table>
        </div>

        <div class="btn-group-vertical">
            <a href="BookandUserManagementServlet?action=addform" class="btn btn-primary"> Add new book </a> <br>
            <a href="BookandUserManagementServlet?action=logout" class="btn btn-primary"> Logout </a> <br>

        </div>

        <script>
            function confirmation() {
                var r = confirm("Are you sure you want to delete this?");
                return r;
            }
        </script>
    </body>
</html>
