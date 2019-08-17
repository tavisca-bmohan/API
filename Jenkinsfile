pipeline 
{ 
	agent any 
	stages 
	{ 
		
		stage('restore')
		{
            		steps
			{
                    		powershell '''
				dotnet restore API.sln --source https://api.nuget.org/v3/index.json
				'''
            		}
        	}
		
		stage('Build') 
		{ 
			steps 
			{ 
				powershell '''
		 		dotnet build API.sln -p:Configration=release -v:n
				'''
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
		
		stage('Compress') 
		{
            		steps 
			{
                		powershell '''compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update'''
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		powershell '''expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force'''
            		}
        	}	
	} 
	
}
