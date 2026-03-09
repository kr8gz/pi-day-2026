'use strict';

function gaussLegendre(iterations) {
	let a = 1;
	let b = 1 / Math.sqrt(2);
	let p = 1;
	let t = 0.25;

	for (let i = 0; i < iterations; i++) {
		const an = a;
		
		a = (a + b) / 2;
		b = Math.sqrt(an * b);
		t = t - p * (an - a) ** 2;
		p *= 2;
	}

	return (a + b) ** 2 / (4 * t);
}

/**
 * @param {String} value - for property 'text'
 * @return {String} - update current property value
 */
export function update(value) {
	return gaussLegendre(10).toString();
}
