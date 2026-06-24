import pandas as pd

def execute_pipeline_unpivot(raw_dataframe):
    """
    Transforms the multi-column wide format search index matrix into a 
    normalized, granular long-format structural layout, decoupling variables.
    """
    long_format_df = pd.melt(
        raw_dataframe, 
        id_vars=['date_axis', 'geo_iso_code'], 
        var_name='search_keyword_string', 
        value_name='normalized_index_value',    
    )
    # Strict conversion of temporal axis into ISO standard data objects
    long_format_df['date_axis'] = pd.to_datetime(long_format_df['date_axis'])
    return long_format_df
