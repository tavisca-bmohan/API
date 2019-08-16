pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
				powershell ''' dotnet restore API.sln --source https://api.nuget.org/v3/index.json 
				dotnet build API.sln -p:Configration=release -v:n 
					''' 
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powershell ''' echo "----------------------------Deploying Project Started-----------------------------" 
				dotnet test UnitTestsForAPI/UnitTestsForAPI.csproj
				echo "----------------------------Deploying Project Completed-----------------------------" ''' 
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				powershell ''' echo "----------------------------Publish Project Started-----------------------------" 
				dotnet publish API.sln -c Release 
				echo "----------------------------Publish Project Completed-----------------------------" ''' 
			} 
		} 

		
	} 
}