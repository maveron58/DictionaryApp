Run 'bundle install' command to install needed gems.
You must setup database config. Copy config/database.yml.dist to config/database.yml and fill in nedded values.
Then create database (rake db:create) and migrate (rake db:migrate).

In main folder are included example dictionary files to upload (eng-pl.yml, eng-pl.csv, pl-by.yml, pl-by.csv).

To use dictionaries you need to upload them using online form.

Structure of YML files:

    Dictionary:
        from: lang_code
        to:   lang_code
    Words:
        word1: definition1
        word2: definition2
        ...

Structure of CSV files:

    lang_from_code, lang_to_code
    word1, definition1
    word2, definition2
    ...