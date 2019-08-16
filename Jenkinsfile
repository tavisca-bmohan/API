pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
		 		sh 'dotnet build API.sln -p:Configration=release -v:n' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				sh 'dotnet test'
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				sh 'dotnet publish'
			} 
		} 
		
		stage('Compress') 
		{
            		steps {	
                		compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update 
            		      }
        	}
		
	} 
	
}
