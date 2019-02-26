-- 0. Use the example done for private donors. Create the post type in WP and create one post with all the fields
-- 1. Name the sheet that contains data to Data
-- 2. Create a sheet by name medi_posts, copy first two rows from private-donors medi_posts sheet. Change the formula according to your data sheet
-- 3. Create a sheet by name medi_postmeta. Copy the first row from the sheet.
-- 3.1. Run the sql below to get the fields that needs to be imported for every post in key value format. Copy the result to the sheet for one post
select meta_key, meta_value from medi_postmeta where post_id = ?;
-- 3.2. Some of the fields always have the same value (not all underscore fields)
-- 3.3. Create reference data and put it in a sheet by the name reference_data. Run the following query
select medi_term_taxonomy.term_id, medi_terms.name, medi_term_taxonomy.taxonomy from medi_term_taxonomy
join medi_terms on medi_term_taxonomy.term_id = medi_terms.term_id
order by 3,2;
-- 3.4. Copy post_row_index column from the private donors sheet. Change the denominator in the formula.
-- 3.5. Refer to private donors meta_value column to create your own formula
-- 4. Create a sheet by name medi_term_relationships and copy header row from private donors sheet
-- 4.1. Copy the post_row_index and change denominator
-- 4.2. To get the list of fields names to put in the formula run the following query. Replace ? with the sample post you have created
select medi_term_taxonomy.taxonomy
from medi_term_relationships
       join medi_term_taxonomy on medi_term_taxonomy.term_taxonomy_id = medi_term_relationships.term_taxonomy_id
       join medi_terms on medi_term_taxonomy.term_id = medi_terms.term_id
where object_id = ?;