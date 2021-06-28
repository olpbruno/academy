with staging as (
    select * 
    from {{ ref('stg_territories')}}
),
 final as (
     select
     row_number() over (order by territory_id) as territory_sk, -- chave surrogate auto incremental
     *
     from staging
 )

select * from final