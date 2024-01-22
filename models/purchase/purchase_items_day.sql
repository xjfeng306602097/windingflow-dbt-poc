{{
  config(
    schema=var('schema')
  )
}}

with 

purchase_items as (
    select *
    from {{ ref('stg_purchase') }}
),


renamed as (
    select
    sku,
    {{dbt.date_trunc('day','createat')}} as create_at,
    sum(amount * qty) as purchase_amount_usd_total,
    sum(qty) as qty,
    sum(amount * qty) / sum(qty) as purchase_amount_usd_avg
    from purchase_items
    group by sku,create_at
)

select * from renamed