/* the encryption table has three columns: md5, sha1, sha256
Add 1 to the end of the md5 addresses as many times as you need to make them the same length as those in the sha256 column
Add 0 to the beginning of the sha1 values to achieve the same result */

SELECT RPAD(md5, LENGTH(sha256) - LENGTH(md5), '1') AS md5,
       LPAD(sha1, LENGTH(sha256) - LENGTH(sha1), '0') AS sha1,
       sha256

FROM encryption;

