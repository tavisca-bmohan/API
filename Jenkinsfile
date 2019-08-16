pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
		 		powershell '''dotnet build API.sln -p:Configration=release -v:n''' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powershell '''dotnet test'''
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				powershell '''dotnet publish -c Release'''
			} 
		} 
		
		
	} 
	
}
