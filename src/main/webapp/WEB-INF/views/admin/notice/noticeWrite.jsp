<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <script src="/ckeditor5-35.2.0/build/ckeditor.js"></script>
    <%@include file="../../../includes/admin/common.jsp" %>
    <title>공지글 등록하기</title>
    <style>
        @font-face {
            font-family: 'InfinitySans-RegularA1';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        *{
            font-family: 'InfinitySans-RegularA1';
        }
        textarea{
            color: black;
        }
        #inptitle{
            width:100%;
            height:40px;

        }
        #inptitle:focus{
            outline: solid 1px #b6d4fe;
        }
        form h5{
            font-size:0.9rem;
            color: black;
        }

        .ck-editor__editable {
            height: 400px;
        }
        .ck-content {
            font-size: 12px;
        }
        #main{
            width: 60%;
        }
    </style>
</head>
<body id="page-top">
<!-- Page Wrapper -->
<div class="d-flex justify-content-start">
    <!-- Sidebar -->
    <%@include file="../../../includes/admin/sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <!-- [[ 오른쪽 div 시작 ]] -->
    <section class="contentdiv d-flex" style="margin-left: 224px">
        <!-- Topbar -->
        <%@include file="../../../includes/admin/header.jsp" %>
        <!-- End of Topbar -->
        <!-- Main Content -->
        <main class="container-fluid">
            <section id="main" class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800 mt-4">공지사항 등록</h1>
            <form action="/admin/notice/write" method="POST" enctype="multipart/form-data">
                <h5 class="mt-3 mb-2">제목</h5>
                <input type="text" name="nt_title" id="inptitle" placeholder="제목을 입력해 주세요"/>
                <h5 class="mt-3 mb-2">내용</h5>
                <textarea type="text" class="text-dark" name="nt_content" id="editor"></textarea>
                <input type="file" name="file" id="fileInput"  value="파일"/>
                <p><input type="submit" value="전송" class="mt-3" /></p>
            </form>
            </section>
        </main>
        <!-- Footer -->
        <%@include file="../../../includes/admin/footer.jsp" %>
        <!-- End of Footer -->
        <!-- End of Content Wrapper -->
    </section>
</div>
<!-- [[ 오른쪽 div 끝 ]] -->
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<script>
        ClassicEditor
            .create(document.querySelector("#editor"),
                {
                    language: "ko",
                })
            .then(newEditor => {
                editor = newEditor;
            })
            .catch(error => {
                console.error(error);
            });
</script>
<script>
    $("#ntWrtBtn").click(function(){
        alert("공지사항 등록 버튼");
    })
</script>
</body>
</html>
