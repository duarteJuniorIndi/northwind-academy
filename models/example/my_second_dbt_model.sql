-- Use the `ref` function to select from other models

select * 
from {{ ref('my_first_dvtr_model') }}
where id = 1