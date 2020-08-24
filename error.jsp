<!-- Maven Archetypeで作成したプロジェクトでは、x.xx.fw.9999形式のメッセージIDを、
・エラー画面に表示するメッセージ
・例外発生時に出力するエラーログ

カスタマイズ方法
<spring:message>要素のcode属性に指定しているメッセージIDのプロジェクト区分の暫定値「xx」を、適切な値に修正する。
-->

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Resource Not Found Error!</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/app/css/styles.css">
</head>
<body>
    <div id="wrapper">
        <h1>Resource Not Found Error!</h1>
        <div class="error">
            <c:if test="${!empty exceptionCode}">[${f:h(exceptionCode)}]</c:if>
            <spring:message code="e.xx.fw.5001" />
        </div>
        <t:messagesPanel />
        <br>
        <!-- ... -->
        <br>
    </div>
</body>
</html>
