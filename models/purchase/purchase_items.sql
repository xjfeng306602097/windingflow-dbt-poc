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
    select *,
    (amount * qty) as purchase_amount_usd
    from purchase_items
)

select * from renamed