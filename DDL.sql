CREATE SEQUENCE km_file_upload_seq START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;

CREATE TABLE km_upload_contents (
    fid              NUMBER DEFAULT km_file_upload_seq.NEXTVAL NOT NULL,
    app_id           NUMBER NOT NULL,
    file_name        VARCHAR2(255) NOT NULL,
    blob_content     BLOB,
    mime_type        VARCHAR2(255),
    charset_type     VARCHAR2(255),
    persist_ind      VARCHAR2(1),
    process_ind      VARCHAR2(1),
    created_datetime DATE DEFAULT sysdate,
    created_by       VARCHAR2(30)
);

DESC apex_application_temp_files;