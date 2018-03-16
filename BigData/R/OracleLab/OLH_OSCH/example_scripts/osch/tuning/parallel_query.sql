
alter session force parallel query parallel 8;

select /*+ PARALLEL(t,8) */ count(*) from MOVIE_FACT_META_PARTB_1 t;

select /*+ PARALLEL(t,8) */ count(*) from MOVIE_FACT_UA t where activity < 4;


