<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" language = "java" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "classes.dto.Book" %>
<%@ page import = "classes.dao.BookRepository" %>
<jsp:useBean id = "bookDAO" class = "classes.dao.BookRepository" scope = "session" />

<html>
    <head>
        <link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel = "stylesheet">
        <link rel = "stylesheet" href = "./resource/css/bootstrap.min.css" />
        <title>도서 목록</title>
    </head>
    <body>
        <div class = "container py-4">
            <%@ include file = "menu.jsp" %>

            <div class = "p-5 mb-4 bg-body-tertiary rounded-3">
                <div class = "container-fluid py-5">
                    <h1 class = "display-5 fw-bold">도서목록</h1>
                    <p class = "col-md-8 fs-4">BookList</p>
                </div>
            </div>
            <% 
                BookRepository dao = BookRepository.getInstance();
                ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
            %>

            <div class = "row align-items-md-stretch    text-center">
                <% 
                    for (int i = 0; i < listOfBooks.size(); i++) {
                        Book book = listOfBooks.get(i);
                %>
                <div class = "col-md-4">
                    <div class = "h-100 p-2">
                        <img src = "./resource/images/<%=book.getFilename() %>" style = "width : 250; height : 350" />
                        <h5><b><%= book.getName() %></b></h5>
                        <p> <%= book.getAuthor() %></p>
                        <br><%= book.getPublisher() %> | <%= book.getUnitPrice() %>원
                        <p> <%= book.getDescription().substring(0, 60) %>...</p>
                        <p> <%= book.getUnitPrice() %>원</p>
                        <p> <a href = "./book.jsp?id=<%=book.getBookId() %>" class = "btn btn-secondary" role = "button"> 상세 정보 &raquo;></a></p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%@ include file = "footer.jsp" %>
        </div>
    </body>
</html>