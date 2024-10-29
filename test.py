


my_query = load_sql('files/opp/rish/query.sql')

from peanuts import mosaic

df = mosaic.mq(my_query)
df