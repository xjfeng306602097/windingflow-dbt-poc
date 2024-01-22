with source as (
    select * from {{source('poc','purchase_sync')}}
),

renamed as (
    select
        id as purchase_id,
        no as number,
        tenantId as tenant_id,
        appId as app_id,
        sku as sku,
        qty as qty,
        amount as amount,
        (amount * 7) as amount_rmb,
        unit as unit,
        {{dbt.date_trunc('day','createAt')}} as create_at
    from source
)

select * from source
