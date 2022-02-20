import React from 'react';

export default class Practice extends React.Component {
	state = {
		image_url: 'https://picsum.photos/200',
		tags: ['tag1', 'tag2', 'tag3'],
	};

	// setting attributes
	styles = {
		fontSize: 50,
		fontWeight: 'bold',
	};

	renderTags(){
		if (this.state.tags.length === 0) return <p>There are no tags!</p>
		
		return <ul>{ this.state.tags.map(tag => <li key={tag}> { tag }</li>) }</ul>
	}

	render() {
		return (
			<div>
				<h1 style={this.styles} >Hello Ray!</h1>
			  <img src={this.state.image_url} alt=""/>
				{ this.renderTags()}
			</div>
		);
	}
}
