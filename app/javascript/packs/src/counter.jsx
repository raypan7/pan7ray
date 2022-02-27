import React from 'react';

export default class Counter extends React.Component {
	state = {
		value: this.props.counter.value,
	};

	handleIncrement = () => { // binding event handler
		this.setState({ value: this.state.value + 1 })   
	}

	render() {
		return (
			<div>	
				<span className={this.getBadgeClasses()}>{this.formatCount()}</span>
				<button
				  onClick={ () => this.props.onIncrement(this.props.counter)}
				  className="btn btn-s econdary btn-sm"
				>Increment</button>
				<button
				  onClick={() => this.props.onDelete(this.props.counter.id)}
					className='btn btn-danger btn-sm m-2'
				>Delete</button>
			</div>

		);
	}

	getBadgeClasses(){
		let classes = "badge m-2 badge-";
		classes += this.state.value === 0 ? "warning" : "primary";
		return classes;
	}

	formatCount() {
		const { value } = this.props.counter;
		return value === 0 ? 'zero' : value;
	}
}
