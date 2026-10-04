# 프로젝트 컨텍스트 — 꾸미스튜디오

- 마지막 스캔: 2026-10-04
- 프로젝트 루트: `C:\Users\cjh88\Desktop\harness`
- 언어/업무: 한국어 중심의 디자인·브랜딩·콘텐츠 제작 컨텍스트
- 상태: 코드 애플리케이션이 아니라 브랜드 컨텍스트와 시각 레퍼런스, 재사용 템플릿을 모아 둔 작업 폴더

## 프로젝트 개요

브랜드는 꾸미스튜디오(`qoomee_studio`)다. 사이트는 “로컬제품 전문 에이전시”라고 소개하고 “브랜딩·패키지·세일즈·로컬 디자인”을 한다고 설명한다. Instagram 공개 프로필 표기에는 “디자인×문화예술기획”이 포함된다.

현재 프로젝트 자료에서 확인되는 주요 작업 맥락:

1. 로컬 제품·브랜드의 아이덴티티, 로고, 패키지 및 판매 콘텐츠
2. 지역 관광·로컬 크리에이터 및 로컬 브랜드 홍보
3. 문화예술·공공 참여·행사 관련 디자인과 영상/홍보 콘텐츠

이 세 가지는 공개 포트폴리오와 프로필을 묶은 업무 맥락이다. 고객 구성, 계약 범위, 사업 실적이나 매출로 단정하지 않는다.

## 디렉터리 구성 및 확인된 자료

### `context/`

- [`qoomee-studio-brand-context.md`](../context/qoomee-studio-brand-context.md) — 공개 사이트 및 SNS 프로필 기반 브랜드·디자인·사업 컨텍스트. 확인 사실과 해석을 구분하고 Instagram 게시물 접근 제한을 명시.

### `template/`

#### Markdown 가이드

- [`portfolio_ppt_template.md`](../template/portfolio_ppt_template.md) — 16:9 PPT 구성, 서비스/프로젝트 페이지, 이미지 배치와 검수 안내.
- [`cardnews_template.md`](../template/cardnews_template.md) — 세로형 카드뉴스 표지 관찰, 6장 콘텐츠 흐름, 문구 블록과 게시 전 체크리스트.
- [`thumbnail_template.md`](../template/thumbnail_template.md) — 16:9 YouTube 썸네일 레이아웃, 문구 가이드와 축소 검수 항목.
- [`team-agent-plan.md`](./team-agent-plan.md) — Claude Code 공식 가이드를 반영한 총괄·리서치·콘텐츠·디자인·검수 업무 흐름 및 에이전트 운용 제안.

#### 카드뉴스 레퍼런스

- [`cardnews.jpg`](../template/cardnews.jpg) — 세로 인물 사진, 어두운 오버레이, 큰 흰색 제목과 블루 강조를 사용한 카드뉴스 표지.

#### 포트폴리오 레퍼런스

- [`portfolio (1).jpg`](../template/portfolio%20(1).jpg) — 제품 패키지 소개와 목업 적용 컷.
- [`portfolio (2).jpg`](../template/portfolio%20(2).jpg) — 쇼핑몰 메인 및 상품 상세/제품 홍보 구성.
- [`portfolio (3).jpg`](../template/portfolio%20(3).jpg) — 3열 숫자·사진·설명 구조의 팀/강점 소개.
- [`portfolio (8).jpg`](../template/portfolio%20(8).jpg) — 온라인 쇼핑몰 홈·상세 화면을 나란히 보여주는 구성.
- [`portfolio (9).jpg`](../template/portfolio%20(9).jpg) — 이커머스 판매 화면과 상품 콘텐츠 사례.
- [`portfolio (10).jpg`](../template/portfolio%20(10).jpg) — 제품/홍보마케팅 콘텐츠 및 화면 사례.
- [`portfolio (15).jpg`](../template/portfolio%20(15).jpg) — 세로 포스터, 정보 그래픽, 메인 비주얼 제작 사례.

#### YouTube 썸네일 레퍼런스

- [`thumb_nail (1).jpg`](../template/thumb_nail%20(1).jpg) — 도구 비교형, 밝은 배경과 큰 외곽선 제목.
- [`thumb_nail (6).jpg`](../template/thumb_nail%20(6).jpg) — 제품/음식 이미지, 배지, 대형 제목을 사용한 튜토리얼 스타일.
- [`thumb_nail (7).jpg`](../template/thumb_nail%20(7).jpg) — 인물과 소프트웨어 화면, 청록색 강조 제목.
- [`thumb_nail (8).jpg`](../template/thumb_nail%20(8).jpg) — 메시지 캡처/서비스 표시와 대형 2줄 제목.

### `.claude/`

- [`settings.json`](../.claude/settings.json) — 프로젝트 로컬 Claude Code `PreToolUse` 훅 설정.
- [`hooks/project-guard.ps1`](../.claude/hooks/project-guard.ps1) — 파일 쓰기 경로와 감지된 위험 셸 명령을 점검하는 PowerShell 훅.
- [`hooks-policy.md`](./hooks-policy.md) — 적용 정책 및 훅의 제한 사항.
- [`agents/researcher.md`](../.claude/agents/researcher.md) — 근거·출처를 조사하는 읽기 전용 전문가.
- [`agents/content-planner.md`](../.claude/agents/content-planner.md) — 콘텐츠 구조와 한국어 카피를 기획하는 읽기 전용 전문가.
- [`agents/visual-designer.md`](../.claude/agents/visual-designer.md) — 매체별 레이아웃·시각 명세를 만드는 읽기 전용 전문가.
- [`agents/fact-checker.md`](../.claude/agents/fact-checker.md) — 사실·출처·브랜드 일관성을 검수하는 읽기 전용 전문가.
- [`agents/visual-qa.md`](../.claude/agents/visual-qa.md) — 가독성·매체 적합성·시각 품질을 검수하는 읽기 전용 전문가.

## 시각 시스템의 작업용 요약

### 포트폴리오 자료

- 흰 바탕, 넓은 여백, 짙은 네이비 헤더와 수평 구분선이 반복된다.
- 우측 상단에 `qoomee studio` 표기가 배치된 레퍼런스가 있다.
- 굵은 한글 제목과 큰 영문 섹션 타이틀, 명확한 이미지 그리드가 사용된다.
- 팀 소개는 번호가 있는 3열 카드, 패키지 소개는 설명과 제품 적용 컷의 조합, 이커머스 사례는 메인 화면과 상품 상세 화면 비교, 포스터 사례는 대표 키 비주얼과 응용물 배열이 적합하다.

### 카드뉴스

- 세로 4:5 방향(1080×1350 권장)의 표지 레퍼런스다.
- 전체 사진 위 어두운 오버레이, 흰색 대형 제목, 블루 강조 요소가 관찰된다.
- 이 시각 방향을 본문까지 강제하지 말고, 본문은 정보 가독성에 맞게 구성한다.

### YouTube 썸네일

- 16:9(1280×720 권장) 가로형.
- 청록 프레임, 어두운 영역, 굵은 흰색 외곽선 제목, 청록/오렌지 키워드 강조가 관찰된다.
- 비교형·튜토리얼형·업데이트형 레이아웃을 구분하며, 피드 크기로 축소해 가독성을 확인한다.

### 공통 정확성 주의

- 팔레트와 서체 인상은 제공된 이미지에서 관찰한 근사치이며 공식 CI 규정이 아니다.
- `logo.jpg`는 현재 프로젝트 루트의 `template/` 파일 목록에서 확인되지 않았다. 별도 제공되기 전에는 기존 로고 파일이 있다고 가정하지 않는다.
- 클라이언트, 프로젝트 날짜, 수행 범위, 성과 수치, 운영 성과는 근거 확인 전 임의로 추가하지 않는다.
- 포트폴리오 자료 속 가격·리뷰·판매량 등 변동 정보는 발표 시점에 다시 확인하거나 제외한다.
- 공식 웹사이트: https://qoomeestudio.myportfolio.com/
- Instagram: https://www.instagram.com/qoomee_studio/ — 조사 당시 공개 프로필은 확인했으나 게시물 본문은 로그인 제한으로 완전히 조사되지 않았다.

## 이후 작업 원칙

- 사용자가 별도 위치를 지정하지 않으면 생성하거나 수정하는 최종 산출물은 `output/` 아래 저장한다.
- `.claude/`는 프로젝트 훅을 설치·관리하기 위한 설정 예외다. 훅은 일반 파일 쓰기를 `output/` 또는 `.claude/`로 제한한다.
- 참고 원본인 `context/`, `template/` 파일은 보존한다.
- 시각 콘텐츠 요청은 해당 유형의 템플릿 문서와 원본 레퍼런스를 먼저 확인한다.
- 외부 공개용 콘텐츠는 사실 검증, 표현의 정확성, 이미지/로고/초상권을 검토한다.
