<html>
<body>
<a href="/">main</a>
<form action="/logout" method="post">
    <input type="submit" value="Sign Out"/>
    <input type="hidden" name="_csrf" value="{{_csrf.token}}">
</form>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="пиши сообщение">
            <input type="text" name="tag" placeholder="пиши тэг">
            <input type="hidden" name="_csrf" value="{{_csrf.token}}">
            <button type="submit">готово</button>
        </form>
    </div>
<div>список</div>
    <form method="post" action="filter">
        <input type="text" name="filter">
        <input type="hidden" name="_csrf" value="{{_csrf.token}}">
        <button type="submit">Найти</button>
    </form>
{{#messages}}
    <div>
        <b>{{text}}</b>
        <b>{{tag}}</b>
        <strong>{{authorName}}</strong>
    </div>
{{/messages}}
</body>

</html>