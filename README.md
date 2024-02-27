# StudyCloud📖 스터디룸 예약 사이트

# Contents 
1. [개발 배경 및 주안점](#1️⃣-개발-배경-및-주안점)
2. [개발 환경](#2️⃣-개발-환경)
3. [주요 기능](#3️⃣-주요-기능)
4. [프로젝트 관련 문서](#4️⃣-프로젝트-관련-문서)
5. [최종발표자료(Google Drive)](https://docs.google.com/presentation/d/181jzaUyEli8fAgDtYkjm3YvEkabIQe7s/edit#slide=id.g22a7829c76b_2_99)

## 1️⃣ 개발 배경 및 주안점

### 개발 배경
![image](https://github.com/asfawf/Study-Cloud/assets/114970539/fe7ca9e3-96ce-4ce0-b00f-57623dd6a721)

### 밴치마킹 사이트 
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/ad950c8f-056d-4d3a-937e-0870935b1a50)

### 팀 멤버
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/008438d8-a925-4296-bb69-a8f925dd1a41)

## 2️⃣ 개발 환경
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/53508906-02b8-484c-a181-78c53c3232c5)

## 3️⃣ 주요 기능
### 팀원 별 개발 사항

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/1d5b7367-7265-48b9-9222-83a30e54a1c8)
<details> 
<summary>로그인 및 계정 찾기 🔎</summary>

## 1. 로그인 + 로그아웃
![로그인](https://github.com/asfawf/Study-Cloud/assets/115056752/ef643d79-0221-4257-89bc-fc8bf8335738)

## 2. 계정 찾기 + 카카오 로그인
![찾기](https://github.com/asfawf/Study-Cloud/assets/115056752/9d2f69bc-091d-45dc-825f-075527f78125)

|핵심 기능|기능 설명|
  |--|----|
  |**로그인**|아이디/비밀번호 기입을 통한 로그인|
  |**로그아웃**|로그아웃 버튼 클릭 또는 창 종료시 로그아웃| 
  |**인증번호 발송**|가입 시 작성한 이메일 주소 체크 후 해당 주소로 아이디 혹은 난수로 재정의 한 비밀번호 전송|
  |**카카오 로그인**| 이전 기록이 남아 있을 경우 자동 로그인 없을 경우 카카오에서 지정한 페이지에 정보 기입 후 리다이렉트 페이지에서 정보를 받아 로그인|
  |**아이디 찾기**|메일 확인을 통해 아이디 찾기 기능 제공|
  |**비밀번호 찾기**|아이디 및 이메일 정보 확인을 통해 비밀번호 찾기 기능 제공|

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/c6d231df-61a1-44b1-80f9-8cd467b87aec)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/d5011e7c-2223-43c0-b1cd-9bb7039b9b86)

</details>

<details> 
<summary>관리자와의 채팅 (문의)🔎</summary>

## 1. 채팅 전송 및 채팅 구간 자동 스크롤
![ezgif com-video-to-gif](https://github.com/asfawf/Study-Cloud/assets/115056752/2c3b3c26-6a3b-4ec1-b25a-309e442b1728)

## 2. 채팅 방 나누기
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/99880472-b5e6-41ad-9f49-2d3252099ff7)

![ezgif com-video-to-gif (1)](https://github.com/asfawf/Study-Cloud/assets/115056752/17f5d1a9-22a6-4865-a4c5-64de0aa7cf68)

  |핵심 기능|기능 설명|
  |--|----|
  |**1:1문의 (관리자 + 일반 유저)**| 1:1문의 시작, 종료, 채팅검색/ 버튼 누르면 관련 답변 
  |**권한 구분**|로그인한 유저 권한에 따라 바로 자신의 채팅방으로 이동 혹은 개설된 채팅방 목록 페이지로 이동
  |**채팅 연결**|회원일 경우 현재 채팅방이 존재하면 해당 채팅방으로 이동  후 이전에 나누었던 채팅 목록 DB에서 출력 관리자의 경우 개설된 채팅방 목록 페이지로 이동 후 선택한 채팅방으로 
  |**채팅 방 구분**|로그인한 일반 유저 아이디에 Socket 연결 구분

  

</details>

<details>
  <summary>계정 관리🔎</summary>

## 1. 유저 정보 수정 및 탈퇴
![ezgif com-video-to-gif (2)](https://github.com/asfawf/Study-Cloud/assets/115056752/744ac122-d7a8-4878-8c93-2d44c674a602)

## 2. 관리자 유저 관리(종류별) + 차단 및 
![ezgif com-video-to-gif (3)](https://github.com/asfawf/Study-Cloud/assets/115056752/65baad6b-80d4-4e8c-ba88-9826283985c7)

 |핵심 기능|기능 설명|
  |--|----|
  |**회원 관리**|현재 가입된 회원 조회
  |**회원 정보 수정**|가입시 작성한 회원 정보 조회 및 정규식 내에서 수정
  |**회원 정보 탈퇴**|가입시(현재 로그인한 계정의) 비밀번호 기입 시 해당 계정 탈퇴
  |**회원 관리 : 차단 , 해제**|해당 조건에서 조회된 아이디를 차단 혹은 차단 해제


![image](https://github.com/asfawf/Study-Cloud/assets/115056752/8856454a-ee26-40c8-9613-e2a174712855)

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/8e6ed591-ed98-4556-8fbf-a6e6647fa82a)

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/1e2ab1f4-7691-43d7-ab10-c85e124bb5b1)


</details>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/fab1b72f-32ee-444b-8066-fff6e0386058)
<details> 
<summary>공지사항 🔎</summary>
  
## 1. 공지사항 조회
![공지사항 조회](https://github.com/asfawf/Study-Cloud/assets/115023222/f9479c3c-cc76-4878-b652-643f33a5f1a2)

## 2. 공지사항 관리(관리자)
![공지사항 admin](https://github.com/asfawf/Study-Cloud/assets/115023222/8b0e089f-8a7d-429f-a083-07bb113db297)

|핵심 기능|기능 설명|
|--|----|
|**공지사항 조회**|로그인 여부 상관없이 selectbox의 값이 변할때(onchange) 공지사항 리스트 변환|
|**공지사항 등록**|분류, 제목이 빈칸일 경우와 내용이 10글자 미만일 경우 알림. 등록 후 새로고침|
|**공지사항 수정**|내용 수정 후 등록시 알림 후 새로고침|
|**공지사항 삭제**|공지사항 삭제시 확인 후 새로고침|

![공지사항 코드1](https://github.com/asfawf/Study-Cloud/assets/115023222/685dfcb1-19b3-434a-a27a-5104ac9b5b40)
![공지사항 코드2](https://github.com/asfawf/Study-Cloud/assets/115023222/ef311c22-5025-49a8-b5a2-125822aa5e20)
![공지사항 코드3](https://github.com/asfawf/Study-Cloud/assets/115023222/4158dca7-719f-4d25-92cf-4e4488540f26)

</details>
<details> 
<summary>공간 목록 및 지도 검색 🔎</summary>

## 1. 공간 목록 검색
![공간 검색](https://github.com/asfawf/Study-Cloud/assets/115023222/e82d41f7-af10-4afa-8477-afae5f6e5ec5)

## 2. 공간 지도 검색
![공간 지도검색](https://github.com/asfawf/Study-Cloud/assets/115023222/45efbef0-8cad-4b59-9e09-b9ab0de85ecc)

|핵심 기능|기능 설명|
|--|----|
|**공간 지역 목록 및 지도 검색**|원하는 지역구 선택시 해당 지역구에 속한 공간 목록(or 지도) 페이지로 이동|
|**공간 가격 목록 및 지도 검색**|가격 선택시 공간의 예약가격 중 최저가에 속한 경우 공간 목록(or 지도) 페이지로 이동|
|**공간 날짜 목록 및 지도 검색**|날짜 선택시 운영날짜가 설정된 공간 목록(or 지도) 페이지로 이동|
|**상세페이지로 이동**|목록 페이지 중 사진 또는 공간이름 클릭, 지도 페이지에서 공간이름의 말풍선 클릭시 상세페이지로 이동|

![공간 검색 코드1](https://github.com/asfawf/Study-Cloud/assets/115023222/7a125b59-97c5-4447-ac71-f99b52c2791f)
![공간 검색 코드2](https://github.com/asfawf/Study-Cloud/assets/115023222/4f709abd-4def-4f66-b883-61745eabd8d3)
</details>
<details> 
<summary>사용자 QNA 🔎</summary>
  
## 1. 상세페이지 QNA 등록
![user qna1](https://github.com/asfawf/Study-Cloud/assets/115023222/dbd0741f-40ce-4faf-8e80-ebd502da7e5f)

## 2. 사용자 QNA 관리
![user qna2](https://github.com/asfawf/Study-Cloud/assets/115023222/9f39ff3b-b4b6-45f6-9f89-660b1e68d97c)

|핵심 기능|기능 설명|
|--|----|
|**QNA 등록**|로그인한 사용자가 상세페이지에서 QNA 등록|
|**QNA 수정**|등록한 QNA를 수정|
|**QNA 삭제**|등록한 QNA를 삭제|

![사용자 QNA1](https://github.com/asfawf/Study-Cloud/assets/115023222/e0c26721-20db-4149-8c27-1880ce2e1688)
![사용자 QNA2](https://github.com/asfawf/Study-Cloud/assets/115023222/a56690e5-9a42-4e80-aad0-7aa1198b4d2b)
![사용자 QNA 관리](https://github.com/asfawf/Study-Cloud/assets/115023222/a39305e3-0213-4c8a-9692-f9399858a652)
</details>
<details> 
<summary>호스트 QNA 🔎</summary>
  
## 1. 호스트 상세페이지, QNA 관리
![host qna](https://github.com/asfawf/Study-Cloud/assets/115023222/6a319944-7396-4b5b-8409-3185be190791)

|핵심 기능|기능 설명|
|--|----|
|**QNA 삭제**|사용자가 등록한 QNA를 삭제|
|**QNA 답변 등록**|호스트가 사용자가 등록한 QNA에 답변 등록|
|**QNA 답변 수정**|등록한 QNA 답변을 수정|
|**QNA 답변 삭제**|등록한 QNA 답변을 삭제|

![호스트 QNA 관리1](https://github.com/asfawf/Study-Cloud/assets/115023222/232647f4-3281-409c-a128-edb24a460563)
![호스트 QNA 관리2](https://github.com/asfawf/Study-Cloud/assets/115023222/9375633d-7ad2-4857-8a3a-6da9bd89caea)
![호스트 QNA 관리3](https://github.com/asfawf/Study-Cloud/assets/115023222/88272eca-8d1c-444f-a69f-746f1efaf117)
</details>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/a592f7c1-ca6d-445e-8e0e-9a0ee2698473)
<details> 
<summary>공간 등록 🔎</summary>

## 공간 등록 ##

![ezgif com-resize](https://github.com/asfawf/Study-Cloud/assets/111718342/e1caf229-810e-4199-b33c-9efe5a3b6284)

|핵심 기능|기능 설명|
|--|----|
|**공간 등록**|host가 소유하고 있는 공간을 웹사이트에 등록|
|**정보 입력**|공간의 상세정보를 입력|
|**이미지 추가**|이미지 업로드|
|**주소 검색**|공간의 주소를 검색후 자동등록|

![code](https://github.com/asfawf/Study-Cloud/assets/111718342/2079fe85-2bce-4153-8eb7-89cec161d53c)


</details>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/1a88875a-6cd9-41cb-93d7-397513b3bbfd)
<details> 
<summary>이용약관 및 회원가입 🔎</summary>

## 1. 이용약관 
![jointerms](https://github.com/asfawf/Study-Cloud/assets/114970539/80757d2d-a114-4ac5-b5f1-db2d8b5aa544)

## 2. 회원가입
![join](https://github.com/asfawf/Study-Cloud/assets/114970539/4228e43b-172e-4284-97f6-b55b182dae22)



|핵심 기능|기능 설명|
|--|----|
|**이용약관**|이용약관 모두 동의하면 회원가입 페이지로 이동|
|**아이디 중복 확인**|아이디 체크 후 자동 중복 체크|
|**비밀번호 확인**|입력한 비밀번호가 동일한지 재확인|
|**인증코드 발송**|이메일 주소 체크 후 기입된 주소로 회원가입시 필요한 인증코드 이메일 발송|
|**인증코드 확인**|입력한 인증코드가 유효한 인증코드인지 확인|
|**회원가입(전체)**|각 항목별로 유효성 검사 체크 후 가입 가능|


![image](https://github.com/asfawf/Study-Cloud/assets/114970539/1de04adc-a908-4a20-9766-fd72768df674)

![image](https://github.com/asfawf/Study-Cloud/assets/114970539/0526e3e7-7024-44ee-b03d-c9df8a537998)
</details>
<details> 
<summary>호스트 공간 운영 시간 관리 🔎</summary>
  
![protime](https://github.com/asfawf/Study-Cloud/assets/114970539/97861e5d-88d8-48d8-af0b-be3df4e33756)


|핵심 기능|기능 설명|
|--|----|
|**날짜 선택**|운영 시간을 설정하고 싶은 날짜 선택, 이미 저장된 정보 출력|
|**시간,가격 선택**|원하는 시간, 가격 선택|
|**조회**|저장된 공간 상페 페이지에서 저장된 정보만 출력|


![image](https://github.com/asfawf/Study-Cloud/assets/114970539/9e763314-441e-4843-8845-54a8be2b5234)

![image](https://github.com/asfawf/Study-Cloud/assets/114970539/616e99f2-e06e-400d-85c9-670220ec5049)
</details>
<details>
<summary>예약 🔎</summary>
  
![reserve](https://github.com/asfawf/Study-Cloud/assets/114970539/23631d35-0346-436d-b64b-83514ca268ef)


|핵심 기능|기능 설명|
|--|----|
|**시간 선택**|이미 예약된 시간 외 활성화된 시간 선택|
|**인원 선택**|버튼을 클릭해 인원 선택|
|**총 가격 계산**|선택한 시간에 따른 가격과 인원을 고려한 총 가격 출력|
|**예약**|필수 항목 선택 후 예약 번호 그리고 예약 신청한 날짜와 시간이 부여된 뒤 저장, 예약 상세 페이지로 이동|


![image](https://github.com/asfawf/Study-Cloud/assets/114970539/2b801826-e062-4412-8bed-4651b21a3e0d)

![image](https://github.com/asfawf/Study-Cloud/assets/114970539/21268b04-e3fa-4a73-a1b7-b509bdd2e282)

![image](https://github.com/asfawf/Study-Cloud/assets/114970539/a7fc85c6-8795-4584-bc6e-e3cfbf00d000)
</details>
<details>
<summary>예약 관리 🔎</summary>

## 1. 예약 조회 / 상세 확인
![reserve_list](https://github.com/asfawf/Study-Cloud/assets/114970539/28cb7959-b45b-44cb-a3ae-b6de164a3dd0)

## 2. 예약 삭제
![reserve_delete](https://github.com/asfawf/Study-Cloud/assets/114970539/55404c0f-d52a-4e25-bb32-65d6f0ce5e27)


|핵심 기능|기능 설명|
|--|----|
|**예약 조회**|내 예약 페이지에서 예약된 리스트 조회|
|**예약 상세 확인**|예약된 공간 이름 클릭하면 예약 상제 정보 페이지로 이동|
|**예약 삭제**|예약 리스트에서 삭제 버튼 클릭하면 예약 정보 삭제|


![image](https://github.com/asfawf/Study-Cloud/assets/114970539/8a830765-efaf-4ab2-a829-a2e2097d4e66)

![image](https://github.com/asfawf/Study-Cloud/assets/114970539/62a9ffb2-89a1-4057-b4e2-4d0db6965237)
</details>

## 4️⃣ 프로젝트 관련 문서



## 1.개발일정
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/6b530869-4132-4987-8edc-1eb7a2773f5e)

## 2.요구사항 정의서
[요구 사항 정의서(Google Drive)](https://docs.google.com/spreadsheets/d/1loN4Tgtiki4tR7pAoieqtcR1SyyVuMhq/edit#gid=1857108071)

## 3. 화면 설계서
[화면 설계서(Google Drive)](https://docs.google.com/presentation/d/1jYvdFFJgSZ9pj4DfdI9S5WbPeexDtDcd/edit?usp=sharing&ouid=100115649288468550394&rtpof=true&sd=true)

## 4. 유스케이스 다이어그램
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/8d86159f-4d2d-4c54-a3be-770a1770752b)

## 5.시퀀스 다이어그램
<details> 
<summary>시퀀스 다이어그램 </summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/e9e25e24-e744-4ca4-9f53-e16842de1985)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/4cdaca8e-0e6d-488e-8656-b7dc5ab80e89)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/a45bbe51-7ab7-463f-a096-8a7c0b69783f)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/96af629b-4004-478c-8f33-cbd51bb09feb)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/4fdf1b0c-0cd5-4bad-840e-561b97046102)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/f048baa3-17a9-43c6-b41f-ad6c54eb954f)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/74c19222-d955-4be7-a3b1-4afa15743599)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/2333ece7-6435-4ee5-88d1-517acbc9ff2d)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/66948362-38f7-4564-b166-1d7f228d6c03)

</details>

## 6.ERD 다이어그램
![StudyCloud erd](https://github.com/asfawf/Study-Cloud/assets/115023222/dd48287f-7efe-4ae1-8685-8c6b277885bc)



## 7.클래스 URL 맵핑

<details>
<summary>MEMBER</summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/f77468d5-337c-4674-afdb-ba98d4780365)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/fb09cccb-b983-4609-9759-c57bbab1783b)

</details>

<details> 
<summary>CHAT + REVIEW + QNA </summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/c04a86e3-3953-4bee-89f4-d2dacc607bd3)

</details>

<details> 
<summary>RESERVE + PRODUCT </summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/8cb89725-0a3c-4e18-9cdf-652769a01516)

</details>

<details> 
<summary>PAY + NOTICE </summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/4909f695-b091-418d-ae14-1a82a21351ea)

</details>

## 8.클래스 다이어그램
<details> 
<summary>클래스 다이어그램 </summary>

![image](https://github.com/asfawf/Study-Cloud/assets/115056752/fbf382fb-0d91-40d1-8379-ab2465e7697f)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/08a136e6-8252-49e2-a468-365c5c068ec5)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/87e77205-df91-40a9-930c-07e5c4bcde99)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/4d11a86e-cb07-4ce4-b90e-755c0fc16015)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/02337a26-38a1-4da4-9df7-b4646817ca92)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/704203ac-8a87-4e61-86c5-41de69f4c009)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/932228ac-0cc3-4eab-b2db-7ed93d59581d)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/694b87f2-99ef-4b4f-81a7-b6f972242f6f)
![image](https://github.com/asfawf/Study-Cloud/assets/115056752/194a7556-ecfe-418d-9afe-c316a32999a5)

</details>

## 9.변경사항 혹은 history

[변경사항 혹은 history 자료(Google Drive)](https://docs.google.com/spreadsheets/d/1mh46rlAMplGj744a4B2tdy9MEyNw-NbUpXg4xLhCX70/edit#gid=0)

