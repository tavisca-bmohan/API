pipeline 
{ 
	agent any 
	parameters 
	{ 
		string(name: 'GIT_HTTPS_PATH', defaultValue: 'https://github.com/tavisca-bmohan/API.git')  
		string(name: 'API_SOLUTION', defaultValue: 'API.sln') 
		string(name: 'TEST_PATH', defaultValue: 'UnitTestsForAPI/UnitTestsForAPI.csproj')
		choice(name:'choices',choices: ['Both','Build', 'Test']) 
	} 

	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
				powershell ''' dotnet restore $(API_SOLUTION) --source https://api.nuget.org/v3/index.json 
				dotnet build $(API_SOLUTION) -p:Configration=release -v:n 
					''' 
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powershell ''' echo "----------------------------Deploying Project Started-----------------------------" 
				dotnet test ${TEST_PATH}
				echo "----------------------------Deploying Project Completed-----------------------------" ''' 
			} 
		}

		stage('Deploy') 
		{ 
			steps 
			{ 
				powershell ''' echo "----------------------------Deploying Project Started-----------------------------" 
				dotnet publish $(API_SOLUTION) -c Release 
				echo "----------------------------Deploying Project Completed-----------------------------" ''' 
			} 
		} 

		
	} 
}