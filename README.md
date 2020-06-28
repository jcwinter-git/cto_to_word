# cto_to_word
This workflow tool is designed to take as an input a survey file in xlsx, the 
standard for use with SurveyCTO and Open Data Kit (ODK). The script
outputs a plaintext version of the survey that pulls in all choices in a 
human readable format. This is designed to address the problem where 
researchers code surveys in a format to optimize machine readability, but 
collaborators less familiar with this format are not able to provide feedback.

This tool is currently in beta - the output to plaintext works. The next steps
are to render this using RMarkdown and saving it as a .docx document that can 
then be reviewed using Track Changes. 

The test file is CTO_to_word_test.xlsx. This is written in the standard ODK
format. cto_cleaning.R is the script which translates the XLSX file into 
plaintext. 
