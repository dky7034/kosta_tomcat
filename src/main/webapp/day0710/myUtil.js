// 객체의 배열을 매개변수로 전달받아 테이블을 생성하여 반환하는 함수
// 매개변수로 전달되는 arr은 배열, 그 배열의 요소는 객체
let makeTableFromArr = function (arr) {
    // 배열의 요소를 모두 테이블로 만들어서 저장하기 위한 변수 str 선언
    let str = "";
    // 테이블 태그 시작을 str에 추가
    str += "<table border='1' width='80%'>";
    // 테이블 헤더 시작을 str에 추가
    str += "<thead>";
    // 헤더 행(tr)을 시작하는 태그를 str에 추가
    str += "<tr>";

    // 배열의 첫 번째 요소(객체)의 모든 키를 순회
    for (let key in arr[0]) {
        // 각 키를 테이블 헤더(th)로 추가
        str += "<th>" + key + "</th>";
    }
    // 헤더 행(tr)을 닫는 태그를 str에 추가
    str += "</tr>";
    // 테이블 헤더 끝을 str에 추가
    str += "</thead>";
    /* end thead */
    // 테이블 바디 시작을 str에 추가
    str += "<tbody>";
    // 배열의 모든 요소(객체)를 순회
    for (let i = 0; i < arr.length; i++) {
        // 현재 순회 중인 요소(객체)를 row에 저장
        let row = arr[i];
        // 데이터 행(tr)을 시작하는 태그를 str에 추가
        str += "<tr>";
        // 현재 행(row)의 모든 키를 순회
        for (let key in row) {
            // 각 키에 해당하는 값을 테이블 데이터(td)로 추가
            str += "<td>" + row[key] + "</td>";
        }
        // 데이터 행(tr)을 닫는 태그를 str에 추가
        str += "</tr>";
    }
    // 테이블 바디 끝을 str에 추가
    str += "</tbody>";
    /* end tbody */
    // 테이블 태그 끝을 str에 추가
    str += "</table>";
    /* end table */
    // 생성된 테이블 HTML 문자열을 반환
    return str;
};


// 배열을 매개변수로 전달받아 순서 없는 목록을 만들어서 반환하는 함수
let makeListFromArr = function (data) {
    let str = "";
    str += "<ul>";
    for (i = 0; i < data.length; i++) {
        str += "<li>" + data[i] + "</li>";
    }
    str += "</ul>"
    return str;
}