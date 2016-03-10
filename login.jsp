<%@include file="bundle/initialization.jspf" %>
<bundle:variable name="head">
    <title>${test.escape(kapp.name)} Login</title>
</bundle:variable>
<div class="container">
    <form action="">
        <!-- CSRF Token field -->
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

        <!-- Username field -->
        <div class="form-group">
          <label for="j_username">${resourceBundle.getString('auth.login.username')}</label>
          <input type="text" name="j_username" id="j_username" class="form-control" autofocus/>
        </div>

        <!-- Password field -->
        <div class="form-group">
          <label for="j_password">${resourceBundle.getString('auth.login.password')}</label>
          <input type="password" name="j_password" id="j_password" class="form-control" autocomplete="off"/>
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-default">${resourceBundle.getString('auth.login.submit')}Login</button>
        </div>
    </form>
</div>
           
<script>        
    $.fn.serializeObject = function()
    {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$(function() {
    $('form').submit(function() {
        var data = JSON.stringify($('form').serializeObject());
         $.ajax({
            method: 'post',
            dataType: 'json',
            contentType: 'application/json',
            url: '/kinetic/${space.slug}/app/login.do',
            data: data,
            beforeSend: function(jqXHR, settings){
               console.log('before')
            },
            success: function(data, textStatus, jqXHR){
               window.location = "${kapp.slug}"
               console.log('success')
            },
            error: function(jqXHR, textStatus, errorThrown){
                console.log('error')
            },
            complete: function(jqXHR, settings){
                console.log('complete')
            },
        });
        
    });
});
</script>