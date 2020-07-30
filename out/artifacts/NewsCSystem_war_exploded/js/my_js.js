$("#button1").click(function () {
    var category = $("#category").val();
    if(category===""){
        $("#wrong_message").append("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">\n" +
            "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "  <strong>警告!</strong> 不能为空值\n" +
            "</div>");
    }else{
        $("#aform").submit();
    }
});
$("#button2").click(function () {
    var title = $("#title").val();
    var content = $("#content").val();
    console.log(title);
    if (title===""){
        $("#wrong_message").append("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\">\n" +
            "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "  <strong>警告!</strong>标题不能为空值\n" +
            "</div>");
    }else if(content===""){
        $("#wrong_message2").append("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
            "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "  <strong>警告!</strong>正文不能为空值\n" +
            "</div>");
    } else{
        $("#add_news_form").submit();
    }
});
$("#login_button").click(function () {
    var user = $("#username").val();
    var pas = $("#password").val();
    if(user === ""){
        $("#username").addClass("is-invalid");
    }else if(pas === ""){
        $("#password").addClass("is-invalid");
    }
    else{
        $("#login").submit();
    }
});
$("#search_button").click(function () {
    // var str1 = $("#search_text");
    $("#search_button").submit();
});
$("#search_t").click(function () {
    var time1 = $("#time1");
    var time2 = $("#time2");
    if(time1 === "" && time2 === ""){
        $("#wrong_message").append("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
            "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "  <strong>警告!</strong>不能为空值\n" +
            "</div>");
    }else if(!isNaN(time1) && !isNaN(time2)){
        $("#wrong_message").append("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\">\n" +
            "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "  <strong>警告!</strong>不能为字符串\n" +
            "</div>");
    } else{
        $("#time_search").submit();
    }
});