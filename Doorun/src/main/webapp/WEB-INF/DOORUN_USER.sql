CREATE TABLE CREW(
    ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(20) NOT NULL UNIQUE,
    MASTER VARCHAR2(20) NOT NULL,
    image_file VA
);

INSERT INTO CREW VALUES(2, 'DOORUN', 'DOORUN');

CREATE TABLE BOARD( -- ��ȸ�� �߰�, ÷������ �߰�
    ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(100) NOT NULL,
    CONTENT VARCHAR2(2000),
    WRITER VARCHAR2(20) NOT NULL, -- �Ŀ� USER ���̺� FK �߰��ϱ�
    IMAGE_FILE VARCHAR2(100),
    REG_DATE DATE DEFAULT SYSDATE NOT NULL,
    BOARD_ID NUMBER NOT NULL,
    CONSTRAINT FK_BOARD_ID FOREIGN KEY(BOARD_ID) REFERENCES BOARD(ID) ON DELETE CASCADE
);



INSERT INTO BOARD(ID, TITLE, CONTENT, WRITER, BOARD_ID)
VALUES(1, '�ȳ��ϼ���', '�ȳ��ϼ���~ ó�� �˰ڽ��ϴ�', 'DOORUN', 0);

INSERT INTO BOARD(ID, TITLE, CONTENT, WRITER, BOARD_ID)
VALUES((SELECT NVL(MAX(ID),1) FROM POST)+1, '�ȳ��ϼ���', '�ȳ��ϼ���~ ó�� �˰ڽ��ϴ�', 'DOORUN', 1);

INSERT INTO BOARD(ID, TITLE, CONTENT, WRITER, BOARD_ID)
VALUES((SELECT NVL(MAX(ID),1) FROM POST)+1, '�ȳ��ϼ���', '�ȳ��ϼ���~ ó�� �˰ڽ��ϴ�', 'DOORUN', 2);

CREATE TABLE REPLY(
    ID NUMBER PRIMARY KEY,
    WRITER VARCHAR2(20) NOT NULL, -- �Ŀ� USER ���̺� FK �߰��ϱ�
    CONTENT VARCHAR2(500),
    POST_ID NUMBER NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE NOT NULL,
    PARENT_ID NUMBER DEFAULT 0 NOT NULL, -- 0 �̸� �θ� ��� ����
    CONSTRAINT FK_POST_ID FOREIGN KEY(POST_ID) REFERENCES POST(ID) ON DELETE CASCADE
);

INSERT INTO REPLY(ID, WRITER, CONTENT, POST_ID)
VALUES((SELECT NVL(MAX(ID),0) FROM REPLY)+1, 'DOORUN', 'EVENT',1);

INSERT INTO REPLY(ID, WRITER, CONTENT, POST_ID)
VALUES((SELECT NVL(MAX(ID),0) FROM REPLY)+1, 'DOORUN', 'FREE',2);

INSERT INTO REPLY(ID, WRITER, CONTENT, POST_ID)
VALUES((SELECT NVL(MAX(ID),0) FROM REPLY)+1, 'DOORUN', 'DOORUN',3);

COMMIT;

CREATE TABLE REPLY(
    ID NUMBER PRIMARY KEY,
    BOARD_ID NUMBER NOT NULL,
    WRITER VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(1000) NOT NULL,
    PARENT_REPLY NUMBER DEFAULT 0 NOT NULL, -- 0: ������ �ƴ�
    REG_DATE DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT REPLY_BOARD_ID_FK FOREIGN KEY (BOARD_ID) REFERENCES BOARD(ID),
    CONSTRAINT REPLY_WRITER_FK FOREIGN KEY (WRITER) REFERENCES MEMBER(ID)
);
