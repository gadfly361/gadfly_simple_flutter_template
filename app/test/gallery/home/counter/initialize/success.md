<div data-description="container" data-description-level="0">
<div data-description="title">
<strong>EPIC</strong>:
home
</div><div data-description="description">As a user, I want to be able to navigate the home screen so that I can access app features.
</div></div>

<div data-description="container" data-description-level="1">
<div data-description="title">
<strong>STORY</strong>:
counter
</div><div data-description="description">As a user, I want to be able to view and interact with the counter feature.
</div></div>

<div data-description="container" data-description-level="2">
<div data-description="title">
<strong>FEATURE</strong>:
initialize
</div><div data-description="description">Initializing the counter
</div></div>

<div data-description="container" data-description-level="3">
<div data-description="title">
<strong>AC</strong>:
success
</div><div data-description="description">When a user navigates to the home page, the app attempts to read the saved counter value and initializes the counter to that value.
</div></div>

## initial state

<table>
  <tbody>
   <tr>
      <td width="300" style="vertical-align:top">
<b>Expect:</b>
<ul>
  <li>Counter should initialize to saved value (1) if read is successful</li>
</ul>
<b>Events:</b>
<ul>
  <li class=info>[app_builder] INFO: locale: en</li>
  <li class=analytic>[ANALYTIC] [page]: Home_Route</li>
  <li>Counter_Event_Initialize</li>
      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/initialize/success/0.0.iphone11.png">      </td>      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/initialize/success/0.1.iphone11.png">      </td>   </tr>
  </tbody>
</table>
