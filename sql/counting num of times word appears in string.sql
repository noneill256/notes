/* Find the number of times the words 'bull' and 'bear' occur in the contents. 
We're counting the number of times the words occur so words like 'bullish' should not be included in our count.
Output the word 'bull' and 'bear' in one column along with the corresponding number of occurrences in the other. */

/* the table:
filename	contents
draft1.txt	The stock exchange predicts a bull market which would make many investors happy.
draft2.txt	The stock exchange predicts a bull market which would make many investors happy, 
              but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market.
final.txt 	The stock exchange predicts a bull market which would make many investors happy, 
              but analysts warn of possibility of too much optimism and that in fact we are awaiting a bear market. 
              As always predicting the future market is an uncertain game and all investors should follow their instincts 
              and best practices.
              */

select word_per_file AS word, 
    COUNT(word_per_file) AS nentry
        -- num of times each word appears in the table
FROM (SELECT filename, 
        UNNEST(STRING_TO_ARRAY(contents, ' ')) AS word_per_file
            -- each word in the passage is turned into its own row
    FROM google_file_store) AS a
WHERE word_per_file IN ('bull','bear')
    -- where the individual word is bull or bear
GROUP BY word_per_file
    -- each word (bear or bull) is grouped into one row
    
    
