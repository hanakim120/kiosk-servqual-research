  

<p>
<a href="https://github.com/hanakim120/kiosk-servqual-research"><img src="https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2Fhanakim120%2Fkiosk-servqual-research&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false"/></a>

<h1 align="center">키오스크 서비스 품질 측정도구 <strong>'K-Servqual'</strong> 개발</h1>
</p>
  
## 📍 Quick overview
### 키오스크 시장규모는 계속해서 증가하지만 불편함을 느끼는 고객들을 위한 서비스 품질 개선 필요
#### 연구 방향
> 1) 선행 연구를 바탕으로 K(Kiosk)-Servqual 차원 정의
> 2) 설문기법을 이용해 데이터 수집 (K-Servqual, Kano, IPA 총 세가지 설문기법 사용)
> 3) K-Servqual 차원과 모형의 타당성 검증 (EFA, CFA, Structured Equation Modeling)
> 4) 가설 검증 (확정된 모형을 통해 본 연구를 통해 세워진 가설 검증)

- 자세한 내용은 아래 최종 발표 자료를 참고해주세요

## 💁🏻‍♀️ 2019 한국품질경영학회 추계 학술제 학술세션(TQM)
- 최종 발표 자료 ([link](https://github.com/hanakim120/kiosk-servqual-research/blob/main/%E1%84%92%E1%85%A1%E1%86%A8%E1%84%92%E1%85%AC%E1%84%87%E1%85%A1%E1%86%AF%E1%84%91%E1%85%AD%E1%84%8C%E1%85%A1%E1%84%85%E1%85%AD.pdf))
- K-Servqual 연구 요약 
<p  align="center">
<img  src="./image/K-Servqual_요약.jpeg"  width="40%"  align="middle"/>
</p>

## 🛠️ Skills
- R 3.6.1 
- SPSS
- Psych, GPArotation package
- Tidyverse, lavvan package

## 🗂️ 연구 배경 및 목적
- 빠른 기술의 변화를 따라가지 못하는 사람들까지도 고려하는 서비스가 제공되기 위해서는 '키오스크'의 특성을 반영한 서비스 품질 측정 척도의 필요성을 느꼈습니다. 
<p  align="center">
<img  src="./image/연구배경.png"  width="40%"  align="middle"/>
<img  src="./image/연구배경2.png"  width="40%"  align="middle"/>
</p>

## 📚 이론적 배경 및 선행연구
- 기존 연구되어왔던 대면 서비스/TBSS(기술 기반 셀프서비스)/인터넷 서비스/키오스크 서비스에 대한 특성 요인들을 조사하였습니다.
<p  align="center">
<img  src="./image/선행연구요약표.png"  width="40%"  align="middle"/>
<img  src="./image/선행연구요약표2.png"  width="40%"  align="middle"/>
</p>

<p  align="center">
<img  src="./image/대면서비스.png"  width="40%"  align="middle"/>
<img  src="./image/TBSS.png"  width="40%"  align="middle"/>
</p>

<p  align="center">
<img  src="./image/인터넷서비스.png"  width="40%"  align="middle"/>
<img  src="./image/키오스크서비스.png"  width="40%"  align="middle"/>
</p>

## ⌨️ 초기모형 및 가설
- 선행연구와 FGI를 통해 키오스크의 특성을 도출하고, 세 차례의 설문지 Pre-testing을 통해 얻은 데이터를  분석하여 k-servqual에 가장 적합하다고 판단되는 8가지 차원을 도출하였습니다.
- 저희 팀은 8가지 차원 중 특히 절약성, 유용성, 통제성이 종합만족도에 영향을 미칠 것이라 예상했습니다. 또한 종합만족도가 재사용 의도에 영향을 미칠 것이라 예상했습니다.
<p  align="center">
<img  src="./image/초기모형.png"  width="40%"  align="middle"/>
<img  src="./image/초기모형_가설.png"  width="40%"  align="middle"/>
</p>

## 📝 설문지 구성
- 설문지는 Google Forms 를 이용하였고, 성별, 키오스크 사용 빈도에 대한 사전 질문, k-servqual 기대와 인지, kano 긍정과 부정, ipa 중요도와 만족도에 대한 질문, 종합만족도와 재사용의도에 대한 사후 질문으로 구성되었습니다.
- 자료수집은 2019년 8월 27일 부터 9월 8일까지 13일간 실시하였고, 최근 6개월 내 거래형 키오스크의 이용경험이 있는 소비자를 대상으로 했습니다. 
- 성별과 사용 빈도에 대한 분포는 표와 같습니다. 
<p  align="center">
<img  src="./image/설문.png"  width="60%"  align="middle"/>
</p>


## 📊 연구결과 분석
- 데이터를 분석하기 전 이상치 제거를 위해 3가지 과정을 거쳤습니다.  
- ipa 만족도와 servqual 인지 설문에서 불성실한 답변이라 판단된 데이터를 제거하였고, box plot 분석을 통해 이상치로 판단된 문항수가 전체에서 20% 이상인 응답자를 제외했습니다. 
- 마지막으로 kano 분석에서 모순적 요소가 3개 이상인 응답자를 제거하여 총 194개의 데이터를 분석에 활용하였습니다. 

### 1) Exploratory Factor Analysis
-  서브퀄인지, IPA만족도, 서브퀄(인지-기대)점수 각각에 대해 KMO, Bartlett분석을 한 결과 모두 유의확률을 만족해서 요인분석을 하기에 적합하다고 판단하였습니다. 
-  요인추정방법에서는 두 방법이 비슷하지만, Pa가 unsensitive하기 때문에 Pa를 선택합니다. 
-  마지막으로 서브퀄인지와 IPA만족도를 각각 Promax, Varimax로 분석한 결과, IPA 만족도의 Varimax 6가지 요인이 가장 적합하다고 나왔습니다. 

<p  align="center">
<img  src="./image/EFA1.png"  width="40%"  align="middle"/>
<img  src="./image/EFA2.png"  width="40%"  align="middle"/>
</p>

- 선행연구를 통해 도출된 8개의 차원 중 유희성과 유형성이 합쳐져서 유형성이 되었고, 개인화와 편리성의 일부가 합쳐져 편리성이 되었습니다. 
- 편리성 문항 중 직원 대면 서비스에 비해 낮은 부담감으로 인한 편리성 문항이 있습니다. 
- 이 문항은 노력의 절약에 관한 문항으로 절약성과 묶일 수 있다고 판단하여 이 문항과 절약성이 합쳐져 절약성이 되어 개선된 최종 k-servqual 차원이 정리되었습니다.

### 2) Confirmatory Factor Analysis
- 서브퀄인지와 IPA만족도를 8가지요인과 6가지 요인에 대해 분석하였습니다. 
- 8개 요인 24문항과 6개 요인 20문항을 비교해본 결과 Servqual인지보다 IPA만족도에서, 8개 요인 24문항 보다 6개 요인 20문항 에서 더 적합한 것을 알 수 있습니다. 
- 따라서 원래의 초기 모형보다 개선모형이 더 나은 것을 알 수 있었습니다.
- 6개 차원에 대한 IPA 만족도를 가지고 종속변수 1개와 2개를 포함했을 때를 비교한 결과, 종속변수 2개를 포함했을 때 더 적합함을 알 수 있었습니다.

<p  align="center">
<img  src="./image/CFA1.png"  width="40%"  align="middle"/>
<img  src="./image/CFA2.png"  width="40%"  align="middle"/>
</p>

### 3) Structured Equation Modeling
- 왼쪽에 있는 모형보다 오른쪽에 있는 mediating model이 CFI, RMSEA값이 더 좋은 결과가 나와 이를 선택했습니다.

<p  align="center">
<img  src="./image/SEM1.png"  width="40%"  align="middle"/>
<img  src="./image/SEM2.png"  width="40%"  align="middle"/>
</p>


## 💻  최종 K-Servqual 측정도구
- 분석 결과, coefficient값이 큰  유형성, 절약성, 유용성이 종합만족도에 가장 큰 영향을 미친다는 것을 알 수 있고, 종합만족도도 재사용의도에 영향을 미친다는 것을 알 수 있었습니다.
- 처음 저희 팀이 생각했던 중요한 세가지 절약성, 유용성, 통제성 중 유용성과 절약성이 연구 결과 중요하다고 나왔습니다. 

<p  align="center">
<img  src="./image/최종K-Servqual.png"  width="60%"  align="middle"/>
</p>


## 📃 K-Servqual 의 특징
#### 1) K-Servqual은 키오스크 이용자의 입장에서 개발된 품질 평가 척도이다. (거래형 키오스크 평가에 활용 가능)
#### 2) K-Servqual은 키오스크를 대상으로 개발된 척도이므로 적용 범위가 넓다. (각 장소 별 키오스크의 성격을 고려하여 수정 및 보완하면 효과적인 척도가 될 수 있다.)
#### 3) 이전 선행연구는 대면서비스와 TBSS, 인터넷 서비스에 대한 평가기준만 개발되어 왔지만 K-Servqual은 TBSS의 특성과 인터넷 서비스의 대한 선행연구를 바탕으로 여러 평가기준들을 적절히 통합, 다면적인 소비자 평가 요소들을 반영하였다.

## 📚 K-Servqual 의 한계
#### 1) K-Servqual은 변화하는 흐름에 맞춰 업데이트해야 하며, 변화하는 소비자의 요구를 수시로 파악하여야 한다.
#### 2) K-Servqual이 커버하지 못하는 어떤 서비스의 특수성이 있을 수 있다.
#### 3) K-Servqual의 향후 연구방향은 키오스크의 서비스 품질을 개선하기 위한 측정도구를 개발했지만, 이를 이용하여 본질적인 서비스 품질을 개선하지 못했기 때문에 개선 방안을 모색해보고 실제 키오스크에 적용하는 것이 목표이다.또한 Servqual 외에도 Kano와 IPA 설문을 통해 얻은 데이터를 분석해 무엇이 키오스크 서비스에 영향을 더 미치고 중요한지를 심층적으로 파악하는 것이 향후 목표이다.

## License

[![License: LGPL v3](https://img.shields.io/badge/License-MIT-g.svg?style=flat-square)](https://tldrlegal.com/license/gnu-lesser-general-public-license-v3-(lgpl-3))

- Copyright [Hana Kim](https://github.com/hanakim120).
