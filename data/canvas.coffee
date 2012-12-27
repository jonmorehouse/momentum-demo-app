module.exports = {

	1 : 

		header: "Laboratory Frame of Reference"
		frame: "laboratory"
		controls : 

			redVelocity: 
				class: "velocity"
				type: "slider"
				min: 0
				default: 10
				max: 20
				name: "Blue Velocity"
				label : "m/s"

			blueVelocity: 
				class: "blue_velocity"
				type: "slider"
				min: 0
				default: 10
				max: 20
				name: "Blue Velocity"
				label : "m/s"

			redMass:
				class: "red_mass"
				type: "slider"
				min: 0
				default: 5
				max: 10
				name: "Red Mass"
				label: "kg"

			blueMass:
				class: "blue_mass"
				type: "slider"
				min: 0
				default: 5
				max: 10
				name: "Blue Mass"
				label: "kg"
	2 : 

		header: "Red Ball Frame of Reference"
		frame: "red_ball"
		controls:

			frameVelocity:
				class: "frame_velocity"
				type: "slider"
				min: 0
				default: 0
				max: 20
				name: "Frame Velocity"
				label: "m/s"
	3:

		header: "Blue Ball Frame of Reference"
		frame : "blue_ball"
		controls: 

			frameVelocity:
				class: "frame_velocity"
				type: "slider"
				default: 0
				min: 0
				max: 20
				name: "Frame Velocity"
				label: "m/s"

	4:

		header : "Custom Ball Frame of Reference"
		frame : "custom"
		controls :

			redVelocity: 
				class: "velocity"
				type: "slider"
				min: 0
				max: 20
				name: "Blue Velocity"
				label : "m/s"

			blueVelocity: 
				class: "blue_velocity"
				type: "slider"
				min: 0
				max: 20
				name: "Blue Velocity"
				label : "m/s"

			redMass:
				class: "red_mass"
				type: "slider"
				min: 0
				max: 10
				name: "Red Mass"
				label: "kg"

			blueMass:
				class: "blue_mass"
				type: "slider"
				min: 0
				max: 10
				name: "Blue Mass"
				label: "kg"

			frameVelocity:
				class: "frame_velocity"
				type: "slider"
				min: -10
				max: -10
				name: "Frame Velocity"
				label: "m/s"

}
