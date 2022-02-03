// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
// render the virtual DOM inside of the real DOM 
import ReactDOM from 'react-dom';

const element = <h1>Hello Ray!</h1>;
ReactDOM.render(element, document.getElementById('root'));
