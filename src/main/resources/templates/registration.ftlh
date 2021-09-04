<#import "parts/common.ftlh" as c>

<@c.page>
    <a href="/">main</a>
    {{#message}}
        {{message}}
    {{/message}}
    регистрация
    <form action="/registration" method="post">
        <div><label> User Name : <input type="text" name="username"/> </label></div>
        <div><label> Password: <input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="{{_csrf.token}}">
        <div><input type="submit" value="Sign In"/></div>
    </form>
    <a href="/login">у меня есть аккаунт</a>
</@c.page>