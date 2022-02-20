import React from 'react';

export default class Counter extends React.Component {
	state = {
		value: this.props.value,
	};

	handleIncrement = () => { // binding event handler
		this.setState({ value: this.state.value + 1 })   
	}

	render() {
		console.log("props:", this.props)
		return (
			<div>	
				<span className={this.getBadgeClasses()}>{this.formatCount()}</span>
				<button
				  onClick={ () => this.handleIncrement()}
				  className="btn btn-s econdary btn-sm"
				>
					Increment
				</button>
			</div>

		);
	}

	getBadgeClasses(){
		let classes = "badge m-2 badge-";
		classes += this.state.value === 0 ? "warning" : "primary";
		return classes;
	}

	formatCount() {
		const { value } = this.state;
		return value === 0 ? 'zero' : value;
	}
}
