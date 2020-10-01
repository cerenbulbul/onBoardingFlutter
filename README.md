# <img src="https://user-images.githubusercontent.com/36292743/94367643-e3169580-0094-11eb-9b9e-2f91d53bf971.png" width="50" height="50"> onBoarding Screen

**How it runs?** 
- Clone the URL in your Android Studio
- Write OnboardingScreen1() in the child(home) of myApp class and run
- Write OnboardingScreen2() in the child(home) of myApp class and run 
- Write OnboardingScreen3() in the child(home) of myApp class and run
- Write OnboardingScreen4() in the child(home) of myApp class and run

&nbsp;
&nbsp;
&nbsp;

  1. [ Onboarding Screen 1 ](#s1)
      * [ Description](#imp1)
      * [ Demo](#Demo1)
  2. [ Onboarding Screen 2](#s2)
      * [ Description](#imp2)
      * [ Demo](#Demo2)
  3. [ Onboarding Screen 3](#s3)
      * [ Description](#imp3)
      * [ Demo](#Demo3)
  4. [ Onboarding Screen 4](#s4)
      * [ Description](#imp4)
      * [ Demo](#Demo4)
  

&nbsp;
&nbsp;
&nbsp;

<a name="s1"></a>
## Onboarding Screen 1


<a name="imp1"></a>
### Description

**Page Layouts:**

There are more than one layouts. I drawed layouts chart. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94847941-2136f080-03d8-11eb-9e00-a19ab1f5f826.png"  />
</p>

**Indicator Animations:**

```
  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color.fromRGBO(137, 168, 73, 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

```


<a name="Demo1"></a>
### Demo

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94834726-9e0c9f00-03c5-11eb-9fcf-e1a0a93235dd.gif" alt="animated" />
</p>






&nbsp;
&nbsp;
&nbsp;

<a name="s2"></a>
## Onboarding Screen 2


<a name="imp2"></a>
### Implementation




<a name="Demo2"></a>
### Demo


<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94834806-b7ade680-03c5-11eb-815b-fa02444d2a38.gif" alt="animated" />
</p>



&nbsp;
&nbsp;
&nbsp;

<a name="s3"></a>
## Onboarding Screen 3


<a name="imp3"></a>
### Implementation


<a name="Demo3"></a>
### Demo

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94834860-c8f6f300-03c5-11eb-898b-8a868438530e.gif" alt="animated" />
</p>


&nbsp;
&nbsp;
&nbsp;

<a name="s4"></a>
## Onboarding Screen 4


<a name="imp4"></a>
### Implementation


<a name="Demo4"></a>
### Demo

<p align="center">
  <img src="https://user-images.githubusercontent.com/36292743/94840318-17f45680-03cd-11eb-86ce-750a3d78b487.gif" alt="animated" />
</p>


&nbsp;
&nbsp;
&nbsp;
