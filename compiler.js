const path = require('path');
const fs = require('fs');
const solc = require('solc');

const AdTractPath = path.resolve(__dirname, 'contracts', 'AdTract.sol');
const source = fs.readFileSync(AdTractPath, 'utf8');

var input = {
    language: 'Solidity',
    sources: {
        'AdTract.sol':{
            content: source
        }
    },
    settings: {
		outputSelection: {
			'*': {
				'*': [ '*' ]
			}
		}
	}
};

var output = JSON.parse(solc.compile(JSON.stringify(input)));

// for (var contractName in output.contracts['AdTract.sol']) {
// 	console.log(contractName + ': ' + output.contracts['AdTract.sol'][contractName].evm.bytecode.object);
// }

module.export = output.contracts['AdTract.sol']['AdTract'];
