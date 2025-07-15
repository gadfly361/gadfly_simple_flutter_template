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
increment
</div><div data-description="description">Incrementing the counter
</div></div>

<div data-description="container" data-description-level="3">
<div data-description="title">
<strong>AC</strong>:
failure_to_save
</div><div data-description="description">When the user taps the increment button, the counter value increases by one, but there is a failure to save the new value.
</div></div>

## initial state

<table>
  <tbody>
   <tr>
      <td width="300" style="vertical-align:top">
      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/increment/failure_to_save/0.0.iphone11.png">      </td>      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/increment/failure_to_save/0.1.iphone11.png">      </td>   </tr>
  </tbody>
</table>
## tap increment button

<table>
  <tbody>
   <tr>
      <td width="300" style="vertical-align:top">
<b>User Actions:</b>
<ul>
  <li>Tapped: widget with type "Home_Button_Increment"</li>
</ul>
<b>Expect:</b>
<ul>
  <li>Counter should increment to 1, even if save fails</li>
</ul>
<b>Events:</b>
<ul>
  <li>Counter_Event_Increment</li>
  <li class=warning>[counter_bloc] WARNING: Failed to save home/counter value</li>
      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/increment/failure_to_save/1.0.iphone11.png">      </td>      </td>
      <td>
      <img width="300" src="../../../../flows/home/screenshots/counter/increment/failure_to_save/1.1.iphone11.png">      </td>   </tr>
  </tbody>
</table>
