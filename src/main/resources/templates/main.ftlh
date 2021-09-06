<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <a href="/">main</a>
    <@l.logout/>
    ${kek!""}
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="пиши сообщение">
            <input type="text" name="tag" placeholder="пиши тэг">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">готово</button>
        </form>
    </div>
    список
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!""}">
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
        <div>
            <b>${message.text}</b>
            <b>${message.tag}</b>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        Нет заявок
    </#list>
</@c.page>