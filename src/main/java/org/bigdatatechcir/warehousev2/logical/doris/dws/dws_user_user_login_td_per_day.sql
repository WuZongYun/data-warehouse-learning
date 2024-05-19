INSERT INTO dws.dws_user_user_login_td(user_id, k1, login_date_last, login_count_td)
select
    nvl(old.user_id,new.user_id),
    CURRENT_DATE(),
    if(new.user_id is null,old.login_date_last,'2020-06-15'),
    nvl(old.login_count_td,0)+nvl(new.login_count_1d,0)
from
    (
        select
            user_id,
            login_date_last,
            login_count_td
        from dws.dws_user_user_login_td
    )old
        full outer join
    (
        select
            user_id,
            count(*) login_count_1d
        from dwd.dwd_user_login_inc
        group by user_id
    )new
    on old.user_id=new.user_id;