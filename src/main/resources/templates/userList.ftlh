<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <center>
<h1>Пользователи</h1>
<table class="table">
    <thead>
    <tr>
        <th>Имя</th>
        <th>Роль</th>
        <th>Изменить</th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
        <td>${user.username}</td>
        <td><#list user.roles as role>${role}<#sep>, </#list></td>
        <td><a href="/user/${user.id}">изменить</a></td>
        </tr>
    </#list>
    </tbody>
</table></center>
</@c.page>