let makeListFromArr = function(data) {
    let str = "";
    str += "<ul>";
    for (i = 0; i < data.length; i++) {
        str += "<li>" + data[i] + "</li>";
    }
    str += "</ul>"
    return str;
}